package Export;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JButton;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

/**
* @author meemei
*
2010 2010-4-27 下午02:18:07
*/
@SuppressWarnings("serial")
public class LogonFrame extends JFrame {

//private JPasswordField passwordField;
private String frameName ;

   /**
* Launch the application
* @param args
*/
// 用户名; 
String user = "root" ;
// 密码;
String password = "1234";
//连接数据库的url;
String url = "jdbc:mysql://localhost:3306/citi";
//查询的表sql语句;
String sql = "select * from t_position_type";
// 备份文件的路径和名称;
String file = "E://sql.txt";

// 

public static void main(String args[]) {
   try {
    LogonFrame frame = new LogonFrame("导出数据");
    frame.setVisible(true);
   } catch (Exception e) {
    e.printStackTrace();
   }
}

/**
* Create the frame
*/
public LogonFrame( String frameName ) {
   super();
   setTitle("导出数据");
   //setIconImage(SwingResourceManager.getImage(LogonFrame.class, "/image/title.jpg"));
   this.frameName = frameName ;
   String windows = "com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
   try {
    UIManager.setLookAndFeel(windows);
   } catch (ClassNotFoundException e) {
    e.printStackTrace();
   } catch (InstantiationException e) {
    e.printStackTrace();
   } catch (IllegalAccessException e) {
    e.printStackTrace();
   } catch (UnsupportedLookAndFeelException e) {
    e.printStackTrace();
   }
   getContentPane().setLayout(null);

   setBounds(100, 100, 424, 272);
   Dimension screensize = Toolkit.getDefaultToolkit().getScreenSize();
   Dimension framesize = this.getSize();
   int x = (int) screensize.getWidth() / 2 - (int) framesize.getWidth()
     / 2;
   int y = (int) screensize.getHeight() / 2 - (int) framesize.getHeight()
     / 2;
  
   this.setLocation(x, y);
   setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
   final JPanel panel = new JPanel();
   panel.setLayout(null);
   panel.setBounds(0, 0, 416, 238);
   getContentPane().add(panel);

   final JButton button = new JButton();
   button.addActionListener(new ActionListener() {
    public void actionPerformed(final ActionEvent e) {
    
     try {     
      //调用封装好的私有的方法;
      boolean flag = export(url, user, password, sql, file);
      if ( flag ) {
       JOptionPane.showMessageDialog(null, "导出文件成功！");
      }
     } catch (Exception e1) {
      e1.printStackTrace();
     }
    }
   });
   button.setText("导出数据");
   button.setBounds(83, 57, 106, 28);
   panel.add(button);

   final JLabel label = new JLabel();
   label.setForeground(new Color(255, 0, 0));
   label.setText("导出数据");
   label.setBounds(171, 10, 72, 28);
   panel.add(label);

   final JButton button_1 = new JButton();
   button_1.setText("New JButton");
   button_1.setBounds(202, 57, 106, 28);
   panel.add(button_1);

   final JButton button_2 = new JButton();
   button_2.setText("New JButton");
   button_2.setBounds(83, 114, 106, 28);
   panel.add(button_2);

   final JButton button_3 = new JButton();
   button_3.setText("New JButton");
   button_3.setBounds(202, 114, 106, 28);
   panel.add(button_3);

   final JButton button_4 = new JButton();
   button_4.setText("New JButton");
   button_4.setBounds(83, 169, 106, 28);
   panel.add(button_4);

   final JButton button_5 = new JButton();
   button_5.setText("New JButton");
   button_5.setBounds(202, 169, 106, 28);
   panel.add(button_5);
}

/** 私有的导出数据的方法;
* @param url
* @param user
* @param password
* @param sql
* @param file
* @return
* @throws Exception
*/
@SuppressWarnings("unused")
private static boolean export(String url ,String user ,String password ,String sql ,String file ) throws Exception {
   boolean flag = false ;
   //注册mysql连接驱动;
   Class.forName("com.mysql.jdbc.Driver");
   FileWriter out = new FileWriter (file) ;
   Connection connection = DriverManager.getConnection(url, user, password);
   Statement st = connection.createStatement();
   //查看表结构
   String table = "desc t_position_type";
   ResultSet rs = st.executeQuery(table);  
   out.write("|");
   while ( rs.next() ) {
    out.write( (String) rs.getObject(1) + "                |");// 输出表的列名
   }
   out.write("\n");
   //sql = "select * from t_position_type";
   ResultSet rs2 = st.executeQuery(sql);//sql查询语句
  
   while ( rs2.next() ) {
    out.write("|");
    out.write( rs2.getInt(1) + "                 |");
    out.write( rs2.getString(2)+"                 |");
    out.write( rs2.getDate(3) + "                 |\n");
   
   }
   out.flush();
   out.close();
   //判断文件是否存在!
   File file2 = new File ( file ) ;
   if ( file2.exists() && file2.length() > 0 ) {
    flag = true ;
   }
   return flag;
} 
}

