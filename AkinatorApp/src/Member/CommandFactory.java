package Member;

public class CommandFactory {

   //싱글톤 패턴
   private CommandFactory(){}
   private static CommandFactory instance = new CommandFactory();
   public static CommandFactory getInstance(){
      return instance;
   }// 여기까지 싱글톤 패턴 만드는 코드
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
    	  System.out.println("이 업데이트 인가??");
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
    	  System.out.println("pay쪽 커맨드쪽");
    	 iCmd=new PayCommand();
      }
   
      else if(cmd.equals("PRODUCTDETAIL")){
    	
    	  System.out.println("productdetail쪽");
    	  iCmd=new ProductdetailCommand();
      }
      else if(cmd.equals("PRODUCTDETAILVIEW")){
    	  System.out.println("productdetailview쪽");
    	  iCmd=new ProductdetailviewCommand();
      }
      else if(cmd.equals("PAYVIEW")){
    	  System.out.println("payview쪽");
    	  iCmd=new PayviewCommand();
      }
      else if(cmd.equals("LOGINVIEW")){
    	  System.out.println("logingview쪽");
    	  iCmd=new LoginviewCommand();
      }
      else{         
         iCmd = null;
      }   
      return iCmd;
      }
   }