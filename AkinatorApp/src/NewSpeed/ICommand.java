package NewSpeed;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommand {
	public Object processCommand(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}
