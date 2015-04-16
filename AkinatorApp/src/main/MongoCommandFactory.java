package main;

import javax.websocket.Session;

import akinator.RegDB;

public class MongoCommandFactory {

	private MongoCommandFactory(){}
	private static MongoCommandFactory instance =new MongoCommandFactory();
	
	public static MongoCommandFactory getinstance(){
		
		return instance;
	}
	public MongoICommand createfactory(String cmd ){
		if(cmd.equals("mongopost")){
			
			return new MongoPost();
		}
		else if(cmd.equals("mongodel")){
			
			return new Mongodel();
		}
		
		else{
			return null;
			//정상적인 요청이 아닌 것에 대해 예외 처리
		}
	}
}
