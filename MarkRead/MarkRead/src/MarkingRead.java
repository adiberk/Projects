import java.awt.Color;
import java.awt.Toolkit;
import java.net.URL;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MarkingRead {
	JFrame frame = new JFrame("Marking");
	JPanel contentPane = new JPanel();
	int width = Toolkit.getDefaultToolkit().getScreenSize().width/2-200;
	int height = Toolkit.getDefaultToolkit().getScreenSize().height/2-150;
	public int number = 0;
	public void marking(){
	    contentPane.setOpaque(true);
        contentPane.setBackground(Color.WHITE);
        contentPane.setLayout(null);
	    
	    URL url = Main.class.getResource("/Javamail/ajax-loader2.gif");
	    ImageIcon loading = new ImageIcon(url);
	    JLabel label = new JLabel("Connecting to server");
	    label.setSize(300, 30);
	    label.setLocation(33, 20);
	    JLabel label2 = new JLabel(loading);
	    label2.setSize(100, 30);
	    label2.setLocation(42, 50);;
	    contentPane.add(label);
	    contentPane.add(label2);
//	    frame.add(new JLabel("loading... ", loading, JLabel.TRAILING));
	    frame.setContentPane(contentPane);
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    frame.pack();
	    frame.setSize(200, 150);
	    frame.setLocationRelativeTo(null);
//	    frame.setVisible(true);
	    frame.setVisible(true);
	}
	public void close(){
		frame.dispose();
	}
}
