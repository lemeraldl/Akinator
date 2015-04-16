package NewSpeed;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	public static CommandFactory getInstance(){
		return instance;
	}
	public ICommand createCommand(String cmd){
		if(cmd.equals("NEWSPEED")){			
			return new NewSpeedCommand();
		}
		else if(cmd.equals("NEWSPEEDMAIN")){
			return new NewSpeedMainCommand();
		}
		else if(cmd.equals("GETNEWSPEED")){
			return new GetNewSpeedCommand();
		}
		return null;
	}
	
}
