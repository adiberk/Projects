

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.mail.*;
import javax.mail.search.FlagTerm;
import javax.swing.JLabel;

public class Main {
	private static Encryptor crypt = new Encryptor();
	static MarkingRead marking = new MarkingRead();
	public static void main(String[] args) throws MessagingException, IOException, InterruptedException {
		// TODO Auto-generated method stub
//		MsgContent content = new MsgContent();
		boolean inFile= false;
//		File file = new File("info.txt");
//		if(file.exists()){
//			    @SuppressWarnings("resource")
//				Scanner scan = new Scanner(file);
//			    mark(scan.nextLine(),scan.nextLine(),scan.nextLine());
//		}
//		else{
			File file1 = new File("info.txt");
			FileWriter fw = new FileWriter("info.txt", true);
			BufferedWriter bw = new BufferedWriter(fw);
		    PrintWriter out = new PrintWriter(bw);
			MailProvider mail = new MailProvider();
			while(mail.check == false){
				Thread.sleep(500);
			}
			if(file1.exists()){
				@SuppressWarnings("resource")
				Scanner scan = new Scanner(file1);
				while(scan.hasNextLine()){
					String x = scan.nextLine();
					System.out.println(x);
					if(x.equals(mail.getProvider())){
						inFile = true;
						break;
					}	
				}
			}
			if(inFile == true){
				@SuppressWarnings("resource")
				Scanner scan = new Scanner(file1);
				String provider = null;
				while(scan.hasNextLine()){
					provider = scan.nextLine();
					if(provider.equals(mail.getProvider())){
						break;
					}
				}
			    mark(provider,scan.nextLine(),scan.nextLine());
			}
			else{
				
				UserInfo grabInfo = new UserInfo();
				while(grabInfo.check == false){
					Thread.sleep(500);
				}
			String provider = mail.getProvider();
			String username = grabInfo.getUsername();
			String encrypted = grabInfo.getPassword();
			out.println(provider);
			out.println(username);
			out.println(encrypted);
			out.close();
			mark(provider, username, encrypted);
		}
	}

	public static void mark(String provider, String username, String password) throws MessagingException, IOException, InterruptedException{
		marking.marking();
		Store emailStore = setConnection(provider, username, password);
		Folder inbox = emailStore.getFolder("INBOX");
		inbox.open(Folder.READ_WRITE);
		Flags seen = new Flags(Flags.Flag.SEEN);
		FlagTerm unseenFlagTerm = new FlagTerm(seen, false);
		Message messages[] = inbox.search(unseenFlagTerm);
		JLabel label = new JLabel("Marking "+ messages.length + " Messages");
		label.setSize(300, 30);
		label.setLocation(33, 20);
		marking.contentPane.remove(0);
		marking.contentPane.add(label);
		marking.contentPane.repaint();
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		inbox.setFlags(messages, seen, true);
//		for(int i =0; i <=messages.length/2; i++){
////		System.out.println(messages[i].getContent().toString());
//		messages[i].setFlag(Flags.Flag.SEEN, true);
//		messages[messages.length-1-i].setFlag(Flags.Flag.SEEN, true);
//	}
		marking.close();
	}
	public static Store setConnection(String provider, String username, String password) throws InterruptedException{
		
	    Properties props = System.getProperties();
	    props.setProperty("mail.store.protocol", "imaps");
		Session emailSession = Session.getDefaultInstance(props, null);
		Store emailStore = null;
		try {     
			emailStore = emailSession.getStore("imaps");
			emailStore.connect("imap."+provider+".com",username, crypt.decrypt(password));
		} catch (Exception e) {
			JLabel label = new JLabel("Error Connecting to mail");
			label.setSize(300, 30);
			label.setLocation(20, 20);
			marking.contentPane.remove(0);
			marking.contentPane.add(label);
			marking.contentPane.repaint();
			Thread.sleep(3000);
			System.exit(0);
		}  
		return emailStore;
		
	}

}
