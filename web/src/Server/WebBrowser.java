package Server;

import java.awt.*;   
import java.awt.event.*;   
import javax.swing.*;   
import javax.swing.event.*;   
import java.net.URL;   
import java.io.*;   
   
   
   
public class WebBrowser   
    extends JFrame {   
  /**  
     *   
     */   
    private static final long serialVersionUID = 1L;   
  JPanel contentPane;   
  BorderLayout borderLayout1 = new BorderLayout();   
  JTextField jTextField1 = new JTextField();   
  JScrollPane jScrollPane1 = new JScrollPane();   
  JEditorPane jEditorPane1 = new JEditorPane();   
   
  //Construct the frame    
  public WebBrowser() {   
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);   
    try {   
      jbInit();   
    }   
    catch (Exception e) {   
      e.printStackTrace();   
    }   
  }   
   
  //Component initialization    
  private void jbInit() throws Exception {   
    contentPane = (JPanel)this.getContentPane();   
    contentPane.setLayout(borderLayout1);   
    this.setSize(new Dimension(349, 272));   
    this.setTitle("��ҳ�����");   
    jTextField1.setText("");   
    jTextField1.addKeyListener(new WebViewer_jTextField1_keyAdapter(this));   
    jEditorPane1.addHyperlinkListener(new WebViewer_jEditorPane1_hyperlinkAdapter(this));   
    contentPane.add(jTextField1, BorderLayout.NORTH);   
    contentPane.add(jScrollPane1, BorderLayout.CENTER);   
    jScrollPane1.getViewport().add(jEditorPane1, null);   
  }   
   
  //Overridden so we can exit when window is closed    
  protected void processWindowEvent(WindowEvent e) {   
    super.processWindowEvent(e);   
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {   
      System.exit(0);   
    }   
  }   
   
  void jEditorPane1_hyperlinkUpdate(HyperlinkEvent e) {   
    if (e.getEventType() ==   
        javax.swing.event.HyperlinkEvent.EventType.ACTIVATED) {   
      try {   
        URL url = e.getURL(); //��õ�ַ    
        jEditorPane1.setPage(url); //��������    
        jTextField1.setText(url.toString());   
      }   
      catch (IOException io) {   
        jTextField1.setText("�����޷��򿪣�");   
      }   
    }   
  }   
   
  void jTextField1_keyPressed(KeyEvent e) {   
    if (e.getKeyChar() == KeyEvent.VK_ENTER) {   
      String str = jTextField1.getText();   
      String substr = str.substring(0, 7); //��ȡ�ִ�    
      String http = "http://";   
      if (!substr.equals(http)) { //����ִ������ڡ�"http://"��"http://"�ַ������뵽str��ͷ    
        str = http + str;   
      }   
      try {   
        jEditorPane1.setPage(str); //��ʾ��ҳ����    
      }   
      catch (IOException err) {   
        jEditorPane1.setText("����" + err);   
      }   
    }   
  }   
  public static void main(String [] args)   
  {   
      WebBrowser WebBro = new WebBrowser();   
      WebBro.setVisible(true);   
  }   
}   
   
class WebViewer_jEditorPane1_hyperlinkAdapter   
    implements javax.swing.event.HyperlinkListener {   
    WebBrowser adaptee;   
   
  WebViewer_jEditorPane1_hyperlinkAdapter(WebBrowser adaptee) {   
    this.adaptee = adaptee;   
  }   
   
  public void hyperlinkUpdate(HyperlinkEvent e) {   
    adaptee.jEditorPane1_hyperlinkUpdate(e);   
  }   
}   
   
class WebViewer_jTextField1_keyAdapter   
    extends java.awt.event.KeyAdapter {   
    WebBrowser adaptee;   
   
  WebViewer_jTextField1_keyAdapter(WebBrowser adaptee) {   
    this.adaptee = adaptee;   
  }   
   
  public void keyPressed(KeyEvent e) {   
    adaptee.jTextField1_keyPressed(e);   
  }   
    
}   
   
