package main;

import java.util.Vector;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

public class mongoDao {

	
/*    ����Ʈ ��Ʈ�� �ȿ��� �Լ��Ǵ� ��ü�� ������  
jsp ���� form ���� ���ְ� ---> �̰��� frontcontroller�� �ް�  --->  commandfactory�� �Ѿ�� �̱��� ������ ���丮 ��ü�� ��� --->

								�ٽ� frontcontroll�οͼ�
--> �̱��� ������ ���丮�� ��ȯ�� icommand�������̽� ������ �޼ҵ忡�� ��(���� �۵��ϴ°�) ��ü�� ����� �ְ� -> ���������̽��� �����ϴ�

���� �������̽��� ����ص� �޼ҵ忡 ������ �ѵ� �� �ż����� �Ǹ������� �̵��� �������� �ּҸ� ��ȯ �ϰ�-> frontcontroller�� �ٽ� ���ƿͼ� 

view.forward(req, resp); ������ �ش� �������� �̵��Ѵ� 


pay dao�� ó�� ���ִ� ���̰� paydto�� �� �ٱ��� �̰��� paycommand���� ���ش� 

pay command���� dto�� ���� �� �ٱ��Ͽ� �� ���� ������  paydao�� �ٱ��ϸ� �־ insert ���ش� 
*/

// ���⼭ post���� �ϴ����� ���ش� 
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
				System.out.println("���� �� ");
				v.add(dto);
		}
		
		
		
		
		return v;
	}
	
}
