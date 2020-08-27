package com.togedog.util;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Coolsms
{
	 public static void sendMsg(String certTel, String randomNum) {
		    String api_key = "";
		    String api_secret = "";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", certTel);	// 수신번호
		    params.put("from", "");	// 발신번호. 
		    params.put("type", "SMS");
		    params.put("text", "Togedog 인증번호는 [" + randomNum +  "] 입니다.");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		  }
}
