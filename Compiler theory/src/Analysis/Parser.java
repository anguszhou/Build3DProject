package Analysis;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Vector;
import Analysis.LexicalAnalysis;
import Analysis.Token;

public class Parser
{
	private int num=-1;
	private Vector<Token>  tokens = new Vector<Token>();    //��Ŵʷ��������
	private Vector<Token>  result = new Vector<Token>();
	private LexicalAnalysis program;
	private Token token = new Token();
	
    public void Initialize() throws IOException // ��ôʷ������Ľ��
    {   	   	
		try
		{
		  program = new LexicalAnalysis();
		  program.doAnalysis(); 
		  tokens = program.getTokens();
		}
		catch (FileNotFoundException e)
		{			
			e.printStackTrace();
		}			  		
    }
          
    public void getnexttoken() //����tokens����һ��Ԫ��
	{				
		if(num<tokens.size()-1)
		{
			num+=1;
			token=tokens.get(num);			
		}
		else
		{
		    Token temp = new Token(-1,"������",-1,-1);
		    token = temp;
		}
	}
      	
	  /*�Ƿ������
	  <p> <���>����= <��ֵ���> | <��֧���> | <ѭ�����>
	  <p> Y->Z|F|W     
	  */ 
	public void isStatement()
	{
		getnexttoken();
		while(token.getType()!=-1)
		{
			if(token.getStr().toLowerCase().equals("if"))
			{
				int ifreturn = ifs();
				if(ifreturn==1)
				{
					result.add(new Token(1,"if-then��֧��䣬Ƕ�׸�ֵ��䣡",token.getLine(),token.getRow()));
					getnexttoken();
				}
				else if(ifreturn==2)
				{
					result.add(new Token(1,"if-then-else��֧��䣬Ƕ�׸�ֵ��䣡",token.getLine(),token.getRow()));
					getnexttoken();
				}
				else 
					endStatement();
			}
			else if (token.getStr().toLowerCase().equals("while"))
			{
				if(whiles()>=0)
				{
					result.add(new Token(1,"While-doѭ����䣬Ƕ�׸�ֵ��䣡",token.getLine(),token.getRow()));
					getnexttoken();
				}
				
			}
			else if(isidentifier()==1)
			{
				if(assign()>=0)
				{
					result.add(new Token(1,"��ֵ��䣡",token.getLine(),token.getRow()));
					getnexttoken();
				}
				else 
				{
					result.add(new Token(0,"�﷨����:��ֵ������",token.getLine(),token.getRow()));
					endStatement();
				}
			}
			else 
			{
				result.add(new Token(0,"�﷨����",token.getLine(),token.getRow()));
   
			}
		}
		
	}
	
	  /*�Ƿ��Ǹ�ֵ���
	  <p> <��ֵ���>����= ��ʶ����=<�������ʽ>
	  <p> Z->B:=A
	  */	 
	public int assign()
	{		
		if(token.getStr().equals(";")||token.getStr().toLowerCase()=="while"||token.getStr().toLowerCase()=="if")
		{
			return -1;
		}
		getnexttoken();
		if(!token.getStr().equals(":="))
		{
			return -1;
		}
		getnexttoken();
		
		if(ArithExp()>=0)		
		    return 1;
		else 
		{
			return -1;
		}
	}

	 /*�Ƿ���ѭ�����
	  <p> <ѭ�����>����= while ��ʶ�� do ��ʶ����=<�������ʽ>	  
	  */
	public int whiles()
	{
		getnexttoken();
		if(isBoolean()==0)
	      {
	    	  result.add(new Token(0,"�﷨����:ѭ���������ʽ����",token.getLine(),token.getRow()));
	    	  endStatement();
	    	  return -1;
	      }
	      getnexttoken();
	      if(!token.getStr().equals("do"))
	      {
	    	  result.add(new Token(0,"�﷨����:ѭ�����ȱ�ٹؼ���do��",token.getLine(),token.getRow()));
	    	  endStatement();
	    	  return -1;
	      }
	      getnexttoken();
	      if(assign()>=0)
	      {	    	 
	    		  return 1;
	      }  
	      else
	      {
	    	  result.add(new Token(0,"�﷨����:ѭ������и�ֵ�������",token.getLine(),token.getRow()));
	    	  return -1;
	      }	     		
	}

	/*�Ƿ��Ƿ�֧���
	  <p> <��֧���>����= if ��ʶ�� then ��ʶ����=<�������ʽ>{else ��ʶ����=<�������ʽ>}	  
	  */
	public int ifs()
	{
      getnexttoken();
      if(isBoolean()==0)
      {
    	  result.add(new Token(0,"�﷨����:��֧�������ʽ����",token.getLine(),token.getRow()));
    	  endStatement();
    	  return -1;
      }
      getnexttoken();
      if(!token.getStr().equals("then"))
      {
    	  result.add(new Token(0,"�﷨����:��֧���ȱ�ٹؼ���then��",token.getLine(),token.getRow()));
    	  endStatement();
    	  return -1;
      }
      getnexttoken();     
      if(assign()>=0)
      {
    	  if(token.getStr().equals(";"))
    		  return 1;
    	  else if(token.getStr().toLowerCase().equals("else"))
    		  {
    		     getnexttoken();
    		     if(assign()>=0)
    		    	 return 2;
    		     else
    		     {
    		    	 result.add(new Token(0,"�﷨����:��֧���ȱ�ٹؼ���then��",token.getLine(),token.getRow()));    		    	  
    		    	  return -1;
    		     }
    		  }
      }
      else
      {
    	  result.add(new Token(0,"�﷨����:��֧����и�ֵ�������",token.getLine(),token.getRow()));   	  
    	  return -1;
      }
      return 1;
      
	}
	
  /*�Ƿ����������ʽ 
  <p> E -> TE'
  <p> E'-> +TE'|-TE'|null 
  <p> T -> FT'
  <p> T'-> *FT'|/FT'|null
  <p> F -> (E) |i
  */
	//������ս�� E
	public int ArithExp()
	{		
		if(token.getType()==2||token.getStr().equals("("))
		{			
			if(Term()>=0)
			{
				if(exp()>=0)
				{
					return 1;
				}
				else 
					return -1;
			}
			else
				return -1;
		}			
		return -1;
	}
	
	//������ս�� E'
	public int exp()
	{		
		if(token.getStr().equals("+")||token.getStr().equals("-"))
		{			
			getnexttoken();
			if(Term()>=0)
			{
				if(exp()>=0)
				{
					return 1;
				}
				else 
					return -1;
			}
			else
				return -1;
		}
		else if(token.getStr().equals(")")||token.getStr().equals(";")||token.getStr().equals("else"))
				return 0;		
		return -1;
	}
	
	//������ս�� T
	public int Term()
	{
		if(token.getType()==2||token.getStr().equals("(")||token.getType()==3)
		{			
			if(Factor()>=0)
			{
				if(term()>=0)
				{
					return 1;
				}
				else 
					return -1;
			}
			else
				return -1;
		}
		return -1;
	}
	
	//������ս�� T'
	public int term()
	{
		if(token.getStr().equals("*")||token.getStr().equals("/"))
		{			
			getnexttoken();
			if(Factor()>=0)
			{
				if(term()>=0)
				{
					return 1;
				}
				else 
					return -1;
			}
			else
				return -1;
		}
		else if(token.getStr().equals("+")||token.getStr().equals("-")||
				token.getStr().equals(")")||token.getStr().equals(";")||
				token.getStr().toLowerCase().equals("else"))
				return 0;		
		return -1;
	} 
	
	//������ս�� F
	public int Factor()
	{
		if(token.getType()==2||token.getType()==3)
		{
			getnexttoken();
			return 1;
		}
		else if(token.getStr().equals("("))
		{			
			getnexttoken();
			if(ArithExp()>=0)
			{
				if(term()>=0)
				{
					return 1;
				}
				else 
					return -1;
			}
			else
				return -1;
		}
		return -1;
	}

	public int isBoolean()
	{
		if(token.getStr().toLowerCase().equals("true"))
			return 1;
		else if(token.getStr().toLowerCase().equals("false"))
			return 1;
		else if(token.getType()==2)
			return 1;
		else if(token.getType()==3)
			return 1;
		return 0;	
	}

	//�������﷨����ʱ������������һ��ȥ������⡣
    public int endStatement()
    {
    	while(!token.getStr().equals(";"))
		{
    		if(token.getStr().toLowerCase().equals("while")||token.getStr().toLowerCase().equals("if"))
        		return 0;
    		getnexttoken();
		}
    	getnexttoken();
    	return 0;
    }

	public int isidentifier()
	{		
		if(token.getType()==2)
		{
		 return 1;
		}
		return 0;
	}
	
	 //���result�е�����
	 public void printResult()
	 {
	  for(int i=0; i<result.size(); i++)
	  {
	   String str = result.elementAt(i).getStr();
	   System.out.println((i+1)+ ": " +"( " +"�к�:"+result.elementAt(i).getLine()+ ", "+"�к�:"+result.elementAt(i).getRow()+ ", " + str + " )");
	  }
	 }
	 
	public static void main(String[] args) throws IOException 
	{
		Parser progrom = new Parser();
		progrom.Initialize();
		progrom.isStatement();
		progrom.printResult();		
	}
	
	public void parserhandler() throws FileNotFoundException
    {
    	
    	getnexttoken();
    	
    	if(token.getStr().toLowerCase().equals("program")) //��������һ��
    	{
    		getnexttoken();
    		
    		if(isidentifier()==1)//�ж��Ƿ��Ǳ�ʶ��
    		{
    			System.out.println("����ʼ");   			
    		}   		
    	    result.add(new Token(0,"����������",token.getLine(),token.getRow()));
    	}
    	getnexttoken();
    	if(token.getStr().equals(";")) //����ͷ����
    	{
    		getnexttoken();
    	}
    	else
    	{
    		result.add(new Token(0,"����ʼȱ�ٷֺţ�",token.getLine(),token.getRow()));
    		getnexttoken();
    	}
    	if(token.getStr().equals("var")) //����������˵�����
    	{
    		getnexttoken();
    		varst(token);  //���÷�����������ĺ���
    	}
    	getnexttoken();//�����ǿ�ִ�в��ֵĿ�ʼ
    	if(token.getStr().equals("begin"))
    	{
    		 getnexttoken();
    		isStatement();   //������ֿ�ִ�г���
    	}
    	getnexttoken();
    	if(token.getStr().equals(";")) // �����ɹ�
    	{
    		
    	}
    }
	
	public int varst(Token token)
	{
		while(true)
		{
			if(isidentifier()==0) 
			{
				result.add(new Token(0,"����˵��������",token.getLine(),token.getRow()));
				while(!token.getStr().equals(";"))
				{
					getnexttoken();
				}
				return 0;
			}
			getnexttoken();
			if(token.getStr().equals(","))			
				getnexttoken();			
			else if(token.getStr().equals(":"))
				{
				  getnexttoken();	
				  if(token.getStr().equals("integer"))
				  {  
					  getnexttoken();	
					  if(token.getStr().equals(";"))
					  {
						  result.add(new Token(1,"����˵�����",token.getLine(),token.getRow()));
						  return 1;
					  }
					  else
					  {
						  result.add(new Token(0,"����˵��������",token.getLine(),token.getRow()));
						  while(!token.getStr().equals(";"))
							{
								getnexttoken();
							}
						  return 0;
					  }
					  
				  }
				  else
				  {
					  result.add(new Token(0,"����˵��������",token.getLine(),token.getRow()));
					  while(!token.getStr().equals(";"))
						{
							getnexttoken();
						}
				      return 0;
				  }
				}
			    
			else 
			{
				result.add(new Token(0,"����˵��������",token.getLine(),token.getRow()));
				while(!token.getStr().equals(";"))
				{
					getnexttoken();
				}
				return 0;
			}
		}
	}
    
	
	
}
