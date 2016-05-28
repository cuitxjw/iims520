package com.iims520.framework.core.bean;

public class Hit {

	private  String OPERATION_DONE = "operationDone";
	
	private int statusCode = 200;
	private String message = null;
	private String forwardUrl = null;
	
	public static Hit success(String msg){
		Hit hit = new Hit();
		hit.message = msg;
		return hit;
	}
	public static Hit success(String msg,String url){
		Hit hit = success(msg);
		hit.forwardUrl = url;
		return hit;
	}
	
	public static Hit fail(String msg,String url){
		Hit hit  =fail(msg); 
		hit.forwardUrl = url;
		return hit;
	}
	
	public static Hit fail(String msg){
		Hit hit = new Hit();
		hit.message = msg;
		hit.statusCode = 300;
		return hit;
	}
	public String getOPERATION_DONE() {
		return OPERATION_DONE;
	}
	public void setOPERATION_DONE(String oPERATION_DONE) {
		OPERATION_DONE = oPERATION_DONE;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getForwardUrl() {
		return forwardUrl;
	}
	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}
	
	
	
}
