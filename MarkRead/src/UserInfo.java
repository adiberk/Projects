import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
class UserInfo {

	JFrame frame; 
    JPanel panel;
    JLabel mail_provider, username, password, label3;
//    private JTextField typeMail;
    private JTextField typeUser;
    private JPasswordField typePass;
    JButton button;
    private String S1,S2, S3;
    boolean check = false;
    
    UserInfo(){

    	frame = new JFrame("Login");
    	panel = new JPanel();
//    	mail_provider = new JLabel("Mail Provider (gmail, mail.yahoo, aol)");
    	username = new JLabel("Username");
    	password = new JLabel("Password");
//    	typeMail = new JTextField(30);
    	typeUser = new JTextField(30);
    	typePass = new JPasswordField(30);
    	label3 = new JLabel("");
    	button = new JButton("Login");
    	frame.add(panel, BorderLayout.CENTER);
//    	panel.add(mail_provider);
//    	panel.add(typeMail);
    	panel.add(username);
    	panel.add(typeUser);
    	panel.add(password);
    	panel.add(typePass);
    	panel.add(label3);
    	panel.add(button);
    	Toolkit tk = Toolkit.getDefaultToolkit();  
    	int frame_width = ((int) tk.getScreenSize().getWidth());  
    	int frame_height= ((int) tk.getScreenSize().getHeight());  

    	frame.setLocation(frame_width/2 - 125, frame_height/2 - 65);

        frame.setSize(350,200);
        frame.setResizable(false);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        /*button-configuration*/
        typePass.addKeyListener(new KeyListener(){

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

    @SuppressWarnings("deprecation")
	private void buttonActionPerformed(KeyEvent evt) {
        /*LOGIC*/
    	Encryptor encrypt = new Encryptor();
//    	S1 = typeMail.getText();
    	S2= typeUser.getText();
    	S3= encrypt.encrypt(typePass.getText());
    	check = true;
    	frame.dispose();
    }
    public String getProvider(){
    	return S1;
    }
    public String getUsername(){
    	return S2;
    }
    public String getPassword(){
    	return S3;
    }
    public void quitFrame(){
    	frame.dispose();
    }
}