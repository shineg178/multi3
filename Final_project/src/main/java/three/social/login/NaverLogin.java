package three.social.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class NaverLogin {
	public static JsonNode getAccessToken(String autorize_code,String state) {
		 
        final String RequestUrl = "https://nid.naver.com/oauth2.0/token";
 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", "GF2vmLo7gThkjpDqkTMs"));
        postParams.add(new BasicNameValuePair("client_secret", "cgHpTxGrGo"));
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:9090/project/login/naver/auth")); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
        postParams.add(new BasicNameValuePair("state", state)); // 로그인 과정중 얻은 code 값
 
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        JsonNode returnNode = null;
 
        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Post parameters : " + postParams);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());

 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
 
        return returnNode;
 
    }
	
	 public static JsonNode getGoogleUserInfo(String autorize_code) {
		 
	        final String RequestUrl = "https://openapi.naver.com/v1/nid/me";
	 
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpGet get = new HttpGet(RequestUrl);
	 
	        JsonNode returnNode = null;
	        
	        // add header
	        get.addHeader("Authorization", "Bearer " + autorize_code);
	 
	        try {
	            final HttpResponse response = client.execute(get);
	            final int responseCode = response.getStatusLine().getStatusCode();
	            
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	            
	            System.out.println("\nSending 'GET' request to URL : " + RequestUrl);
	            System.out.println("Response Code : " + responseCode);
	 
	 
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	        return returnNode;
	 
	    }
}
