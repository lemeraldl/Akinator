package Member;

public class CommandFactory {

   //�̱��� ����
   private CommandFactory(){}
   private static CommandFactory instance = new CommandFactory();
   public static CommandFactory getInstance(){
      return instance;
   }// ������� �̱��� ���� ����� �ڵ�
   ICommand iCmd;
   public ICommand createComand(String cmd, MemberDto dto){
      if(cmd.equals("MAIN")){
         iCmd= new MainCommand();
      }
      else if(cmd.equals("REGFORM")){
         iCmd= new RegFormCommand();
      }
      else if(cmd.equals("REGCONFIRM")){      
         iCmd= new RegConfirmCommand();
      }
      else if(cmd.equals("REGCOMPLETE")){      
         iCmd = new RegCompleteCommand();
      }
      else if(cmd.equals("REGCONFIRMED")){      
    	  iCmd = new RegConfirmedCommand();
      }
      else if(cmd.equals("LOGIN")){
         iCmd = new LoginCommand();
      }
      else if(cmd.equals("LOGOUT")){
         iCmd = new LogoutCommand();
      }
      else if(cmd.equals("SEARCH")){
         iCmd = new SearchCommand();
      }
      else if(cmd.equals("UPDATE")){
    	  System.out.println("�� ������Ʈ �ΰ�??");
         iCmd = new UpdateRegCommand();
      }
      else if(cmd.equals("DELETE")){
         iCmd = new RegDeleteCommand();
      }
      else if(cmd.equals("MYPAGE")){
          iCmd = new MyPageCommand();
       }
      else if(cmd.equals("FINDPASSWORD")){
    	  iCmd = new FindPasswordCommand();
      }
      else if(cmd.equals("PAY")){
    	  System.out.println("pay�� Ŀ�ǵ���");
    	 iCmd=new PayCommand();
      }
   
      else if(cmd.equals("PRODUCTDETAIL")){
    	
    	  System.out.println("productdetail��");
    	  iCmd=new ProductdetailCommand();
      }
      else if(cmd.equals("PRODUCTDETAILVIEW")){
    	  System.out.println("productdetailview��");
    	  iCmd=new ProductdetailviewCommand();
      }
      else if(cmd.equals("PAYVIEW")){
    	  System.out.println("payview��");
    	  iCmd=new PayviewCommand();
      }
      else if(cmd.equals("LOGINVIEW")){
    	  System.out.println("logingview��");
    	  iCmd=new LoginviewCommand();
      }
      else{         
         iCmd = null;
      }   
      return iCmd;
      }
   }