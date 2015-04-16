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
			//�������� ��û�� �ƴ� �Ϳ� ���� ���� ó��
		}
	}
}
