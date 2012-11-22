package Analysis;

public class Token
{
	
		 
		  private int type;
		  private String str;
		  private int line;
          private int row;
		  
		  public int getType()
		{
			return type;
		}


		public void setType(int type)
		{
			this.type = type;
		}


		public String getStr()
		{
			return str;
		}


		public void setStr(String str)
		{
			this.str = str;
		}


		public int getLine()
		{
			return line;
		}


		public void setLine(int line)
		{
			this.line = line;
		}
		
		public int getRow()
		{
			return row;
		}


		public void setRow(int row)
		{
			this.row = row;
		}


		Token()
		{
			super();
		}


		public Token(int type, String str, int line, int row)
		{
			super();
			this.type = type;
			this.str = str;
			this.line = line;
			this.row = row;
		}

		
		 } 

