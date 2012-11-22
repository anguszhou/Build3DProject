package Analysis;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Vector;

public class LexicalAnalysis {
 
 public Token newToken()
 {
	 return new Token();
 }
 
 class UnToken{
	 
	  private int line;
	  private String str;
	  
	  UnToken(String st,int lin)
	  {	   
	   str = st;
	   line = lin; 
	  } 
	 }
 public static final int KEY_WORD = 1;
 public static final int IDENTIFIER = 2;
 public static final int NUMBER = 3;
 public static final int OPERATOR = 4;
 public static final int OTHERSIGN = 5;
 public static final int END_OF_FILE =65535;

 private int rows  = 0;
 private int lines = 1;
 private String[] keyword = new String[]{"program","begin","end","var","integer","if","then","else","do","while"};
 private String[] operator = new String[]{"+", "-","<",">", "=",":=","*","/"};
 private String[] othersign = new String[]{":","(",",", ")" ,";"};
 
 private Vector<Token>  tokens = new Vector<Token>();    //��źϷ��ַ�
 private Vector<UnToken>untokens = new Vector<UnToken>();//��ŷǷ��ַ�
 //������
 private BufferedInputStream fis;
 private FileOutputStream fos;
 
 LexicalAnalysis() throws FileNotFoundException
 { 
  FileInputStream file = new FileInputStream(new File("E:\\input.txt"));
  fis = new BufferedInputStream(file); 
 }
 
 //���ַ����ͱ����֡���������ָ����Ƚ�
 private int compare(String str1, int i)
 {
  switch(i)
  {
  case KEY_WORD:
   for(int j=0; j<keyword.length; j++)
    if(str1.toLowerCase().equals(keyword[j]))
     return j+1;
   break;
  case OPERATOR:
   for(int j=0; j<operator.length; j++)
    if(str1.equals(operator[j]))
     return j+1;
   break;
  case OTHERSIGN:
   for(int j=0; j<othersign.length; j++)
    if(str1.equals(othersign[j]))
     return j+1;
   break;
  }
  return 0;
 }
 
 
 //�ж��Ƿ�������
 private boolean isNumber(char c)
 {
  if( c > '9' || c < '0')
   return false;
  else
   return true;  
 }
 
 //�ж��Ƿ�����ĸ�������»��ߣ�
 private boolean isChar(char c)
 {
  if( (c <= 'z' && c >= 'A') || c == '_' )
   return true;
  else
   return false;
 }
 
 
 public void doAnalysis() throws IOException
 {  
  char c = (char) fis.read();  
  rows +=1;
  while((int)c!= END_OF_FILE )        
        {   
		   if( isChar(c))    //�����һ���ַ�����ĸ��ת����ĸ�����������ܽ��Ϊ�ؼ��ֻ��ʶ��
		    c = dealWithChar(c);   
		   else if (isNumber(c)) //�����һ���ַ������֣�ת�����ִ����������ܽ��Ϊ����
		    c = dealWithNumber(c);
		   else           //�����һ���ַ�������ĸ���֣������Ϊ��������ָ�����ע�͵��������ַ�
		    c = dealWithOther(c);    
        }             
 }
 
 //�����һ���ַ����������ŵ����.
 private char dealWithOther(char c) throws IOException {
  
  String str = new String();  
  if (Character.isSpaceChar(c)) //�жϿո�
  {
   c = (char) fis.read();
   rows +=1;
   return c;
  } 
  if (c=='\r')
  {
	  
	  c = (char) fis.read();	
	  rows +=1;
	  return c;
  }
  if (c=='\n')
  {
	  lines=lines+1;
	  rows = 0;
	  c = (char) fis.read();	
	  rows +=1;
	  return c;
  }
  if (c==':')
  {	
	 //System.out.println( fis.markSupported()); �����Ƿ�֧��mark()/reset().
	 fis.mark(20);
	 char c1 = c ;
	 c = (char) fis.read();
	 rows +=1;
	 if(c=='=')    //��ǰ�����жϸ�ֵ�� ��= 
	 {
		  str = new String()+c1+c;
		  String no = String.valueOf(OPERATOR)+String.valueOf(compare(str,OPERATOR));
		  tokens.add(new Token(Integer.parseInt(no), str,lines,rows-1)); 
		  c = (char) fis.read();
		  rows +=1;
		  return c;
	 }
	 else
	 {
		   String no = String.valueOf(OTHERSIGN)+String.valueOf(compare(new String()+c1,OTHERSIGN));
		   str = str + c1;
		   tokens.add(new Token(Integer.parseInt(no), str,lines,rows-1));
		   fis.reset();
		   c = (char) fis.read();
		   rows +=1;
		   return c;
	 }
  }
  
  if (compare(new String()+c,OTHERSIGN)!=0)   //�жϷָ���
  {	  	    
	   String no = String.valueOf(OTHERSIGN)+String.valueOf(compare(new String()+c,OTHERSIGN));
	   str = str + c;
	   tokens.add(new Token(Integer.parseInt(no), str,lines,rows));
	   c = (char) fis.read();
	   rows +=1;
	   return c;
	  
  }
  
  if(compare(new String()+c,OPERATOR)!=0)  //�жϲ�����
  {
	   String no = String.valueOf(OPERATOR)+String.valueOf(compare(new String()+c,OPERATOR));
	   str = str + c;
	   tokens.add(new Token(Integer.parseInt(no), str,lines,rows));
	   c = (char) fis.read();
	   rows +=1;
	   return c; 
  }    
  
  if(compare(str,OPERATOR)!=0)      //�жϲ�����
   {
	  String no = String.valueOf(OPERATOR)+String.valueOf(compare(str,OPERATOR));
	  tokens.add(new Token(Integer.parseInt(no), str,lines,rows-1)); 
	  return c;
   }
  if(c=='/')      
  {
	   c = (char) fis.read();
	   rows +=1;
	   if(c=='/')          //�жϵ���ע��
	   {
		   c = (char) fis.read();
		   while(c!='\r')
		   {
			   c = (char) fis.read();
			   rows +=1;
		   } 
		   if(c=='\n')
		   {
			   c = (char) fis.read();
			   rows =1;
			   return c;
		   }		   
	   }	   
	   if(c=='*')    //�ж϶���ע��
	   {
		   c = (char) fis.read();
		   rows +=1;
		   while(c!='*')
		   {
			   c = (char) fis.read();
			   rows +=1;
		   } 
		   if(c=='/')
		   {
			   c = (char) fis.read();
			   rows +=1;
			   return c;
		   }
	   }
	   c = (char) fis.read();
	   rows +=1;
	   return c;
  }
  untokens.add(new UnToken(String.valueOf(c),lines));
  c = (char) fis.read();
  rows +=1;
  return c;
 }
 
 //�����һ���ַ������ֵ����.
 private char dealWithNumber(char c) throws IOException {
  
  String str = new String();
  int temp = rows;
  while (isNumber(c))           //�����֣���ӵ�str��;�������֣���str����ʶ�����������str���뵽tokens��
  {
   str = str + c;
   c = (char) fis.read();
   rows +=1;
  }  
  
  Token token = new Token(NUMBER, str,lines,temp);
  tokens.add(token);
     
  return c;
 }

 //�����һ���ַ�����ĸ�����
 private char dealWithChar(char c) throws IOException {

  String str = new String();
  int temp = rows;
  
  while (isNumber(c)||isChar(c))    //�����ֻ���ĸ����ӵ�str��;�������ֺ���ĸ����str����ʶ����ı�ʶ����ؼ���
  {   
   str = str + c;
   c = (char) fis.read(); 
   rows +=1;
  } 
 
  if(compare(str,1)!=0)  
  {  
	  String no = String.valueOf(KEY_WORD)+String.valueOf(compare(str,KEY_WORD));
	  tokens.add(new Token(Integer.parseInt(no), str,lines,temp));    
  }
  else
   tokens.add(new Token(IDENTIFIER, str,lines,temp)); 
  return c;
  
 }

 //���tokens�е�����
 public void printTokens()
 {
  for(int i=0; i<tokens.size(); i++)
  {
   int type = tokens.elementAt(i).getType();
   String str = tokens.elementAt(i).getStr();
   System.out.println((i+1)+ ": " +"( " +tokens.elementAt(i).getLine()+ ", "+tokens.elementAt(i).getRow()+"," + type + ", " + str + " )");
  }
 }
 
//���untokens�е�����
 public void printUnTokens()
 {
  for(int i=0; i<untokens.size(); i++)
  {
   int type = untokens.elementAt(i).line;
   String str = untokens.elementAt(i).str;
   System.out.println((i+1)+ ": " +"( " +type + str + " )");
  }
 }
 
 //����ʷ����������output.txt
 public void outputTokens() 
 {
	 OutputStreamWriter out = null;	 
	 BufferedWriter buff =null;
	 
	 try
	{
		fos = new FileOutputStream("E:\\output.txt");	 
	    out = new OutputStreamWriter(fos);	 
	    buff = new BufferedWriter(out);
	 
	 for(int i=0; i<tokens.size(); i++)
	  {
	   int type = tokens.elementAt(i).getType();
	   String str = tokens.elementAt(i).getStr();
	   buff.write(String.valueOf(i+1)+ ": " +"( " + String.valueOf(type) + ", " + str + " )"+"\r\n");
	  }
	 }catch(Exception e){
			
			e.printStackTrace();
			
		}finally{
			
			try {
				if (buff != null)
					buff.close();
				if (out != null)
					out.close();
				if (fos != null)
					fos.close();
			} catch (Exception e2) {
			
			}
			
		}
 }

 public static void main(String[] args) throws IOException {
         
  LexicalAnalysis program = new LexicalAnalysis();
  
  program.doAnalysis(); 
  program.printTokens();  //����Ϸ��ַ�  
  program.printUnTokens(); //����Ƿ��ַ� 
  program.outputTokens();  //�����output.txt
  
 }

public Vector<Token> getTokens()
{
	return tokens;
}

public void setTokens(Vector<Token> tokens)
{
	this.tokens = tokens;
}


}

