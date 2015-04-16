package main;

import java.io.IOException;
import java.util.Collection;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.ParseConversionEvent;

import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;

public class MongoPost implements MongoICommand {

	Mongo m;
	DB db;
	
	public MongoPost(){
		try {
			m = new Mongo("localhost");
			
			db= m.getDB("test");
			

			
			if(db!=null){
				System.out.println("connect");
				Set<String> colls= db.getCollectionNames();
			}
			
	}catch(Exception err){
		System.out.println(err);
	}
	
	}
	
	
	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("euc-kr");
		req.setCharacterEncoding("euc-kr");
		
	String product1=req.getParameter("product1");
	int product2=Integer.parseInt(req.getParameter("product2"));
	String lsw	=req.getParameter("lsw");
	int old	=Integer.parseInt(req.getParameter("old"));
	
	
	DBCollection items1= db.getCollection("products");
	DBCollection items2=db.getCollection("user");
	
	BasicDBObjectBuilder documentbuilder = new BasicDBObjectBuilder().start()
			.add("name", product1)
			.add("price", product2);
	
	BasicDBObjectBuilder documentbuilder2 = new BasicDBObjectBuilder().start()
			.add("name", lsw)
			.add("old", old);
	
	
	items1.insert(documentbuilder.get());
	items2.insert(documentbuilder2.get());
	/*
	BasicDBObject doc1=new BasicDBObject();
	BasicDBObject doc2=new BasicDBObject();
	doc1.put("name"+product1, "price"+product2);
	doc2.put("name"+lsw, "old"+old);
	

	items1.insert(doc1);
	items2.insert(doc2);*/
	
	
/*	BasicDBObjectBuilder documentbuilder = new BasicDBObjectBuilder().start()
			.add(product1,product2)
			.add(lsw, old);
	*/
	
	
	
		return "/TeamAkinator/mongotest_proc.jsp";
	}

	
	
}
