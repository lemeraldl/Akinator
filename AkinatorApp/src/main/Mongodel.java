package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.sun.swing.internal.plaf.basic.resources.basic;

public class Mongodel implements MongoICommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		DB db;
		HttpSession session=req.getSession();
		Mongodbconnection cc= new Mongodbconnection();
		String delArticle = (String) session.getAttribute("delArticle");
		System.out.println("delarticle"+delArticle);
		db=cc.mconnection();
		DBCollection collection =db.getCollection("boardexam");
		
		BasicDBObject document=new BasicDBObject();
		document.put("nickname", delArticle);
		collection.remove(document);
		
		System.out.println("mongodelÂÊ");
		return "/TeamAkinator/mongoboardselect_proc.jsp";
	}

}
