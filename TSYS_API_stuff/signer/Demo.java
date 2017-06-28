
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpResponse;

import com.cloud.sdk.http.HttpMethodName;


public  class Demo {

 //replace real region
 private static final String region = "eu-de";

 //replace real service name
 private static final String serviceName = "";

 public static void main(String[] args) {
  
  	//replace real AK
  	String ak = "QWKZSO0UCURY3RMUWJAG";
  	//replace real SK
  	String sk = "534NseG7J7uakUIfVzTvkMSOjAHKl62sSghYPcAx";
	String url = "https://ecs.eu-de.otc.t-systems.com/v2/2aa216a5629d41729e5079dac471d927/servers/725977e1-be95-47a5-8ad1-1eab8d63ba86";
  /*for(String s: args)
  	System.out.println(s);*/
   if(args.length<2){
    System.out.println("not enough arguments");
    System.exit(1);
  }
  
  	System.out.println(args[0]);
  if(args[0].equals("get")){
    get(ak, sk, args[1]);
  } 
  else if(args[0].equals("put")){

    if(args.length<2){
      System.out.println("not enough arguments");
      System.exit(1);
    }
    post(ak, sk, args[1], args[2]);
  }
 /*
  // put method
  //replace real body
  String putbody = "";
  //replace real url
  String putUrl = "urlString";
  //put(ak, sk, putUrl, putbody);

  // delete method
  //replace real url
  String deleteUrl = "urlString";
  //delete(ak, sk, deleteUrl);*/
 }

 public static void put(String ak, String sk, String requestUrl,
   String putBody) {

  AccessService accessService = null;
  try {
   accessService = new AccessServiceImpl(serviceName, region, ak, sk);
   URL url = new URL(requestUrl);
   HttpMethodName httpMethod = HttpMethodName.PUT;
   
   InputStream content = new ByteArrayInputStream(putBody.getBytes());
   HttpResponse response = accessService.access(url, content,
     (long) putBody.getBytes().length, httpMethod);
   
   System.out.println(response.getStatusLine().getStatusCode());
   
  
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   accessService.close();
  }

 }
 
 public static void patch(String ak, String sk, String requestUrl,
   String putBody) {

  AccessService accessService = null;
  try {
   accessService = new AccessServiceImpl(serviceName, region, ak, sk);
   URL url = new URL(requestUrl);
   HttpMethodName httpMethod = HttpMethodName.PATCH;
   InputStream content = new ByteArrayInputStream(putBody.getBytes());
   HttpResponse response = accessService.access(url, content,
     (long) putBody.getBytes().length, httpMethod);
   
   System.out.println(convertStreamToString(response.getEntity()
     .getContent()));
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   accessService.close();
  }

 }

 public static void delete(String ak, String sk, String requestUrl) {

  AccessService accessService = null;

  try {
   accessService = new AccessServiceImpl(serviceName, region, ak, sk);
   URL url = new URL(requestUrl);
   HttpMethodName httpMethod = HttpMethodName.DELETE;

   HttpResponse response = accessService.access(url, httpMethod);
   System.out.println(convertStreamToString(response.getEntity()
     .getContent()));
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   accessService.close();
  }

 }

 public static void get(String ak, String sk, String requestUrl) {

  AccessService accessService = null;

  try {
System.out.println("*");
   System.out.println(serviceName);
   System.out.println(region);
   System.out.println(ak);
   System.out.println(sk);
   accessService = new AccessServiceImpl(serviceName, region, ak, sk);
System.out.println("*");
   URL url = new URL(requestUrl);
System.out.println("*");
   HttpMethodName httpMethod = HttpMethodName.GET;
System.out.println("*");
   HttpResponse response;
System.out.println("*");
   response = accessService.access(url, httpMethod);
System.out.println("*");
   System.out.println(convertStreamToString(response.getEntity()
     .getContent()));
  } catch (Exception e) {
System.out.println("**");
   e.printStackTrace();
  } finally {
   accessService.close();
  }

 }

 public static void post(String ak, String sk, String requestUrl,
   String postbody) {

  AccessService accessService = new AccessServiceImpl(serviceName,
    region, ak, sk);
  URL url = null;
  try {
   url = new URL(requestUrl);
  } catch (MalformedURLException e) {
   e.printStackTrace();
  }
  InputStream content = new ByteArrayInputStream(postbody.getBytes());
  HttpMethodName httpMethod = HttpMethodName.POST;
  HttpResponse response;

  try {
   response = accessService.access(url, content,
     (long) postbody.getBytes().length, httpMethod);
   System.out.println(convertStreamToString(response.getEntity()
     .getContent()));
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   accessService.close();
  }
 }

 private static String convertStreamToString(InputStream is) {
  BufferedReader reader = new BufferedReader(new InputStreamReader(is));
  StringBuilder sb = new StringBuilder();

  String line = null;
  try {
   while ((line = reader.readLine()) != null) {
    sb.append(line + "\n");
   }
  } catch (IOException e) {
   e.printStackTrace();
  } finally {
   try {
    is.close();
   } catch (IOException e) {
    e.printStackTrace();
   }
  }

  return sb.toString();
 }

}
