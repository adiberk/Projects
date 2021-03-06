import java.awt.BorderLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class MailProvider {
	JFrame frame; 
    JPanel panel;
    JLabel mail_provider;
    private JTextField typeMail;
    JButton button;
    boolean check = false;
    
    public MailProvider(){
    	frame = new JFrame("Provider");
    	panel = new JPanel();
    	mail_provider = new JLabel("Mail Provider (gmail, mail.yahoo, aol)");
    	typeMail = new JTextField(20);
    	button = new JButton("Next");
    	frame.add(panel, BorderLayout.CENTER);
    	panel.add(mail_provider);
    	panel.add(typeMail);
    	
    	
    	panel.add(button);
    	Toolkit tk = Toolkit.getDefaultToolkit();  
    	int frame_width = ((int) tk.getScreenSize().getWidth());  
    	int frame_height= ((int) tk.getScreenSize().getHeight());  

    	frame.setLocation(frame_width/2 - 125, frame_height/2 - 65);

        frame.setSize(250,150);
        frame.setResizable(false);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        /*button-configuration*/
        typeMail.addKeyListener(new KeyListener(){

			@Override
			public void keyPressed(KeyEvent evt) {
				// TODO Auto-generated method stub
				if(evt.getKeyCode() == KeyEvent.VK_ENTER){
					buttonActionPerformed(evt);
				}
			}

			@Override
			public void keyReleased(KeyEvent evt) {
				// TODO Auto-generated method stub
			}

			@Override
			public void keyTyped(KeyEvent evt) {
				// TODO Auto-generated method stub
			}
        	
        });
        button.addActionListener(new ActionListener() {
        	public void actionPerformed(ActionEvent evt) {
           }
        });


        /*close-button-configuration*/

    }

    private void buttonActionPerformed(KeyEvent evt) {
        /*LOGIC*/
    	check = true;
    	frame.dispose();
    }
    public String getProvider(){
    	if (typeMail.getText().equals("yahoo")){
    		return "mail.yahoo";
    	}
    	return typeMail.getText();
    }
}
