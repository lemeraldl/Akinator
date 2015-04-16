package Board.board;

public class CommandFactory {

	private CommandFactory(){
		
	}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory getInstance(){
			return instance;
	}
	
	public ICommand createCommand(String cmd){
		if(cmd.equals("BOARDMAIN")){
			return new ListCommand();
		}
		
		else if(cmd.equals("POST")){
			return new PostCommand();
		}
		else if(cmd.equals("UPDATE")){
			return new UpdateCommand();
		}
		else if(cmd.equals("READ")){
			return new ReadCommand();
		}
		else if(cmd.equals("DELETE")){
			return new DeleteCommand();
		}
		else if(cmd.equals("GETBOARD")){
			return new GetboardCommand();
		}
		else if(cmd.equals("REPLYGETBOARD")){
			return new ReplyGetBoardCommand();
		}
		else if(cmd.equals("REPLY")){
			return new ReplyCommand();
		}
		else if(cmd.equals("POSTGETBOARD")){
			return new PostGetBoardCommand();
		}
		return null;
	}	
}
