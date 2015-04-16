package akinator;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();//�̱���
	public static CommandFactory getInstance(){
		return instance;
	}
	
	public ICommand createCommand(String cmd){
		if(cmd.equals("REGDB")){
			return new RegDB();
		}
		else{
			return null;
			//�������� ��û�� �ƴ� �Ϳ� ���� ���� ó��
		}
		
	}
}
