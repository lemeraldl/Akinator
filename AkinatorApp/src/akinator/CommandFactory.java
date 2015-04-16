package akinator;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();//싱글톤
	public static CommandFactory getInstance(){
		return instance;
	}
	
	public ICommand createCommand(String cmd){
		if(cmd.equals("REGDB")){
			return new RegDB();
		}
		else{
			return null;
			//정상적인 요청이 아닌 것에 대해 예외 처리
		}
		
	}
}
