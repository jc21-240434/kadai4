package mygoogle.ai.studio;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class GoogleAIStudioAPI {
	// JSON形式のリクエストを作成するためのGsonインスタンス
    private final Gson gson = new Gson();
    
    
    public String getAnswer(String inputText) {
    	// ApiInformationクラスのインスタンスを作成してAPIキーとURLを取得
    	ApiInformation info = new ApiInformation();
		String apiKey = info.getApiKey();
		String apiUrl = info.getUrl();
		
    	try {
    		/*  ======================================
    		    = 送信用のリクエストをJSON形式で作成 =
    		    ======================================
    		    {
	    			"contents": 							…　(e)
	    				[									…　(d)
	    					{
	    						"parts":					…　(c)
	    						 [							…　(b)
	    							{
	    								"text": "入力文"	…　(a)
	    							}
	    						]
	    					}
	    				]
	    		}
    		
    		 */
            JsonObject textObj = new JsonObject();		//　(a)作成
            textObj.addProperty("text", inputText);
            
            JsonArray partsArr = new JsonArray();		//　(b)作成
            partsArr.add(textObj);

            JsonObject contentObj = new JsonObject();	//　(c)作成
            contentObj.add("parts", partsArr);	

            JsonArray contentsArr = new JsonArray();	//　(d)作成
            contentsArr.add(contentObj);

            JsonObject payload = new JsonObject();		//　(e)作成
            payload.add("contents", contentsArr);

            String jsonInput = gson.toJson(payload);
            
            // プロクシなどクライアント環境の設定
            HttpClient client = HttpClient.newBuilder()
            		.version(HttpClient.Version.HTTP_2)
                    .connectTimeout(java.time.Duration.ofSeconds(30))
                    .proxy(
                        java.net.ProxySelector.of(
                            new java.net.InetSocketAddress("172.17.0.2", 80)
                        )
                    )
                    .build();
            
            // リクエスト送信（POST)の構築
            HttpRequest apiRequest = HttpRequest.newBuilder()
                    .uri(URI.create(apiUrl))
                    .header("Content-Type", "application/json")
                    .header("x-goog-api-key", apiKey)
                    .POST(HttpRequest.BodyPublishers.ofString(jsonInput))
                    .build();

            // リクエストの送信
            HttpResponse<String> apiResponse = client.send(apiRequest, HttpResponse.BodyHandlers.ofString());
            // レスポンスの取得
            String responseBody = apiResponse.body();
            
            // 返却されたJSONをコンソール出力（確認用）
            System.out.println(responseBody);

            // レスポンスJSONから回答テキストを抽出する
            String aiResponseText = parseGeminiResponse(responseBody);

            return aiResponseText;

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            e.printStackTrace();
            return "通信が中断されました: " + e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return "エラーが発生しました: " + e.getMessage();
        }
    	
    }    
    
    // Gsonを使って安全にテキストを抽出するメソッド
    // JSONのキーが	"text"のところを返す
    private String parseGeminiResponse(String json) {
        try {
            // 文字列をJson要素のツリーにパース
            JsonObject rootObj = JsonParser.parseString(json).getAsJsonObject();
            
            // 階層を順番に安全にチェックしながら潜る
            if (rootObj.has("candidates")) {
                JsonArray candidates = rootObj.getAsJsonArray("candidates");
                if (candidates.size() > 0) {
                    JsonObject firstCandidate = candidates.get(0).getAsJsonObject();
                    
                    if (firstCandidate.has("content")) {
                        JsonObject content = firstCandidate.getAsJsonObject("content");
                        
                        if (content.has("parts")) {
                            JsonArray parts = content.getAsJsonArray("parts");
                            if (parts.size() > 0) {
                                JsonObject firstPart = parts.get(0).getAsJsonObject();
                                
                                if (firstPart.has("text")) {
                                    return firstPart.get("text").getAsString();
                                }
                            }
                        }
                    }
                }
            }
            return "APIから想定外のレスポンスが返されました。詳細: " + json;
        } catch (Exception e) {
            return "JSONの解析に失敗しました。";
        }
	}
}
