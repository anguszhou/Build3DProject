package chat2;

import java.awt.Component;

import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class test
{
public static void main(String[] args)
{
	/*JFileChooser   chooser   =   new   JFileChooser(); 
	chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 
	int   returnVal   =   chooser.showOpenDialog(null); 

	if(returnVal   ==   JFileChooser.APPROVE_OPTION)   { 
	        System.out.println( "You   chose   to   open   this   file:   "   + 
	                chooser.getSelectedFile().getName()); 
	} */
	
	JFileChooser jfcWorkFolder = getJFileChooser("d:\\"); 
	jfcWorkFolder.setDialogTitle("title"); 
	jfcWorkFolder.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 

	int iState = jfcWorkFolder.showDialog(jfcWorkFolder, "确定"); 

	} 
	public static JFileChooser getJFileChooser(String defaultName){ 
	JFileChooser jfcWorkFolder = new JFileChooser(defaultName); 
	try { 
	JPanel cons = (JPanel) jfcWorkFolder.getComponent(3); 
	Component jp = cons.getComponent(0); 
	System.out.println(jp.getClass()); 
	JPanel la = (JPanel) jp; 
	JLabel jl = (JLabel) la.getComponent(0); 
	System.out.println(jl.getText()); 
	jl.setText("文件路径："); 

	} catch (Exception e) { 

	} 

	return jfcWorkFolder;
}
}
