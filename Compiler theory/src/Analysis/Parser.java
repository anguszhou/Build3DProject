package Analysis;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Vector;
import Analysis.LexicalAnalysis;
import Analysis.Token;

public class Parser
{
	private int num=-1;
	private Vector<Token>  tokens = new Vector<Token>();    //存放词法分析结果
	private Vector<Token>  result = new Vector<Token>();
	private LexicalAnalysis program;
	private Token token = new Token();
	
    public void Initialize() throws IOException // 获得词法分析的结果
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
          
    public void getnexttoken() //返回tokens的下一个元素
	{				
		if(num<tokens.size()-1)
		{
			num+=1;
			token=tokens.get(num);			
		}
		else
		{
		    Token temp = new Token(-1,"结束了",-1,-1);
		    token = temp;
		}
	}
      	
	  /*是否是语句
	  <p> <语句>：：= <赋值语句> | <分支语句> | <循环语句>
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
					result.add(new Token(1,"if-then分支语句，嵌套赋值语句！",token.getLine(),token.getRow()));
					getnexttoken();
				}
				else if(ifreturn==2)
				{
					result.add(new Token(1,"if-then-else分支语句，嵌套赋值语句！",token.getLine(),token.getRow()));
					getnexttoken();
				}
				else 
					endStatement();
			}
			else if (token.getStr().toLowerCase().equals("while"))
			{
				if(whiles()>=0)
				{
					result.add(new Token(1,"While-do循环语句，嵌套赋值语句！",token.getLine(),token.getRow()));
					getnexttoken();
				}
				
			}
			else if(isidentifier()==1)
			{
				if(assign()>=0)
				{
					result.add(new Token(1,"赋值语句！",token.getLine(),token.getRow()));
					getnexttoken();
				}
				else 
				{
					result.add(new Token(0,"语法错误:赋值语句错误！",token.getLine(),token.getRow()));
					endStatement();
				}
			}
			else 
			{
				result.add(new Token(0,"语法错误！",token.getLine(),token.getRow()));
   
			}
		}
		
	}
	
	  /*是否是赋值语句
	  <p> <赋值语句>：：= 标识符：=<算术表达式>
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

	 /*是否是循环语句
	  <p> <循环语句>：：= while 标识符 do 标识符：=<算术表达式>	  
	  */
	public int whiles()
	{
		getnexttoken();
		if(isBoolean()==0)
	      {
	    	  result.add(new Token(0,"语法错误:循环语句条件式有误！",token.getLine(),token.getRow()));
	    	  endStatement();
	    	  return -1;
	      }
	      getnexttoken();
	      if(!token.getStr().equals("do"))
	      {
	    	  result.add(new Token(0,"语法错误:循环语句缺少关键字do！",token.getLine(),token.getRow()));
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
	    	  result.add(new Token(0,"语法错误:循环语句中赋值语句有误！",token.getLine(),token.getRow()));
	    	  return -1;
	      }	     		
	}

	/*是否是分支语句
	  <p> <分支语句>：：= if 标识符 then 标识符：=<算术表达式>{else 标识符：=<算术表达式>}	  
	  */
	public int ifs()
	{
      getnexttoken();
      if(isBoolean()==0)
      {
    	  result.add(new Token(0,"语法错误:分支语句条件式有误！",token.getLine(),token.getRow()));
    	  endStatement();
    	  return -1;
      }
      getnexttoken();
      if(!token.getStr().equals("then"))
      {
    	  result.add(new Token(0,"语法错误:分支语句缺少关键字then！",token.getLine(),token.getRow()));
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
    		    	 result.add(new Token(0,"语法错误:分支语句缺少关键字then！",token.getLine(),token.getRow()));    		    	  
    		    	  return -1;
    		     }
    		  }
      }
      else
      {
    	  result.add(new Token(0,"语法错误:分支语句中赋值语句有误！",token.getLine(),token.getRow()));   	  
    	  return -1;
      }
      return 1;
      
	}
	
  /*是否是算术表达式 
  <p> E -> TE'
  <p> E'-> +TE'|-TE'|null 
  <p> T -> FT'
  <p> T'-> *FT'|/FT'|null
  <p> F -> (E) |i
  */
	//处理非终结符 E
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
	
	//处理非终结符 E'
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
	
	//处理非终结符 T
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
	
	//处理非终结符 T'
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
	
	//处理非终结符 F
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

	//当检测出语法错误时，跳到程序下一句去继续检测。
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
	
	 //输出result中的内容
	 public void printResult()
	 {
	  for(int i=0; i<result.size(); i++)
	  {
	   String str = result.elementAt(i).getStr();
	   System.out.println((i+1)+ ": " +"( " +"行号:"+result.elementAt(i).getLine()+ ", "+"列号:"+result.elementAt(i).getRow()+ ", " + str + " )");
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
    	
    	if(token.getStr().toLowerCase().equals("program")) //处理程序第一句
    	{
    		getnexttoken();
    		
    		if(isidentifier()==1)//判断是否是标识符
    		{
    			System.out.println("程序开始");   			
    		}   		
    	    result.add(new Token(0,"程序名有误！",token.getLine(),token.getRow()));
    	}
    	getnexttoken();
    	if(token.getStr().equals(";")) //程序头结束
    	{
    		getnexttoken();
    	}
    	else
    	{
    		result.add(new Token(0,"程序开始缺少分号！",token.getLine(),token.getRow()));
    		getnexttoken();
    	}
    	if(token.getStr().equals("var")) //表明下面是说明语句
    	{
    		getnexttoken();
    		varst(token);  //调用分析变量定义的函数
    	}
    	getnexttoken();//下面是可执行部分的开始
    	if(token.getStr().equals("begin"))
    	{
    		 getnexttoken();
    		isStatement();   //处理各种可执行程序
    	}
    	getnexttoken();
    	if(token.getStr().equals(";")) // 分析成功
    	{
    		
    	}
    }
	
	public int varst(Token token)
	{
		while(true)
		{
			if(isidentifier()==0) 
			{
				result.add(new Token(0,"变量说明语句错误",token.getLine(),token.getRow()));
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
						  result.add(new Token(1,"变量说明语句",token.getLine(),token.getRow()));
						  return 1;
					  }
					  else
					  {
						  result.add(new Token(0,"变量说明语句错误",token.getLine(),token.getRow()));
						  while(!token.getStr().equals(";"))
							{
								getnexttoken();
							}
						  return 0;
					  }
					  
				  }
				  else
				  {
					  result.add(new Token(0,"变量说明语句错误",token.getLine(),token.getRow()));
					  while(!token.getStr().equals(";"))
						{
							getnexttoken();
						}
				      return 0;
				  }
				}
			    
			else 
			{
				result.add(new Token(0,"变量说明语句错误",token.getLine(),token.getRow()));
				while(!token.getStr().equals(";"))
				{
					getnexttoken();
				}
				return 0;
			}
		}
	}
    
	
	
}
