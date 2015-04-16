package Admin;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();//�̱���
	public static CommandFactory getInstance(){
		return instance;
	}
	
	public ICommand createCommand(String cmd){
		if(cmd.equals("USER")){
			return new AdminUser();
		}
		else if(cmd.equals("USERDEL")){
			return new AdminUserDel();
		}
		else if(cmd.equals("PRODUCT")){
			return new AdminProduct();
		}
		else if(cmd.equals("PRODUCTDEL")){
			return new AdminProductDel();
		}
		else if(cmd.equals("ARTICLE")){
			return new AdminArticle();
		}
		else if(cmd.equals("ARTICLEDEL")){
			return new AdminArticleDel();
		}
		else if(cmd.equals("LOGIN")){
			return new LoginCommand();
		}
		else{
			return null;
			//�������� ��û�� �ƴ� �Ϳ� ���� ���� ó��
		}
		
	}
}
