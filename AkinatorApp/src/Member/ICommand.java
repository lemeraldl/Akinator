package Member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommand {
	public Object processCommand(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException;
	// 어떤 값이 리턴 될지 알 수 없기 때문에 반환 값은 Object
}
