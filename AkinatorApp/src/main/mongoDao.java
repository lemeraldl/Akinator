package main;

import java.util.Vector;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class mongoDao {

	
/*    프론트 컨트롤 안에서 함수또는 객체를 만나서  
jsp 에서 form 으로 쏴주고 ---> 이것을 frontcontroller가 받고  --->  commandfactory로 넘어가서 싱글톤 패턴의 팩토리 객체를 얻고 --->

								다시 frontcontroll로와서
--> 싱글톤 패턴의 팩토리의 반환형 icommand인터페이스 형태의 메소드에서 모델(실제 작동하는곳) 객체를 내뱉어 주고 -> 그인터페이스를 구현하는

모델의 인터페이스에 명시해둔 메소드에 구현을 한뒤 그 매서드의 맨마지막에 이동할 페이지의 주소를 반환 하고-> frontcontroller로 다시 돌아와서 

view.forward(req, resp); 를통해 해당 페이지로 이동한다 


pay dao는 처리 해주는 넘이고 paydto는 쓸 바구니 이것을 paycommand에서 써준다 

pay command에서 dto를 만들어서 이 바구니에 다 세팅 해준후  paydao에 바구니를 넣어서 insert 해준다 
*/

// 여기서 post에서 하던것을 해준다 
	public void inputmongo(MongoDto mdto ){
		
		
	}
	
	
	public Vector getmongoboardinfo(){
		Vector v = new Vector();
		DB db;
		Mongodbconnection cc =new Mongodbconnection();
		db=cc.mconnection();
		DBCollection collection = db.getCollection("boardexam");
		DBCursor cursor = collection.find();
		while(cursor.hasNext()){
			MongoBoardDto dto = new MongoBoardDto();
			//System.out.println(cursor.next());
		DBObject dbobject=cursor.next();
		/*Object nickname=dbobject.get("nickname");
		Object phonenum=dbobject.get("phonenum");
		Object pwd=dbobject.get("pwd");
		Object email=dbobject.get("email");*/
		
				dto.setNickname((String) dbobject.get("nickname"));
				dto.setPhonenum((double) dbobject.get("phonenum"));
				dto.setPwd((double) dbobject.get("pwd"));
				dto.setEmail((String) dbobject.get("email"));
				System.out.println(dto.getNickname());
				System.out.println(dto.getPhonenum());
				System.out.println(dto.getPwd());
				System.out.println(dto.getEmail());
				System.out.println("벡터 전 ");
				v.add(dto);
		}
		
		
		
		
		return v;
	}
	
}
