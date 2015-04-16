package main;

import java.net.UnknownHostException;
import java.util.Set;

import com.mongodb.DB;
import com.mongodb.Mongo;

public class Mongodbconnection {
	Mongo m;
	DB db;
	
	public DB mconnection(){
		try {
			m = new Mongo("localhost");
			db= m.getDB("test");
			

			
			if(db!=null){
				System.out.println("connect");
				
			}
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return db;
	}
}
