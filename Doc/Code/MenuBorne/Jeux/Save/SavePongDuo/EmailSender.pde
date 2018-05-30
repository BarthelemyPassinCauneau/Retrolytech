import java.util.*;
import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;


public class EmailSender{

    protected static final String SMTP_HOST_NAME = "smtp.gmail.com";
    protected static final String SMTP_PORT = "465";
    protected static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";


  public void sendSave(String gameName, String mes, String dest){
   

        try{
         
    //ouverture d'une session. la session gére les informations de configuration (nom d'utilisateur, mot de passe, hôte) nécessaires pour utiliser les fonctionnalités de JavaMail
    Properties props= new Properties();
    props.setProperty("mail.from", "Retrolytech@gmail.com"); // @ expediteur
    
    props.put("mail.smtp.host", SMTP_HOST_NAME);
    props.put("mail.smtp.auth", "true");
    props.put("mail.debug", "true");
    props.put("mail.smtp.port", SMTP_PORT);
    props.put("mail.smtp.socketFactory.port", SMTP_PORT);
    props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
    props.put("mail.smtp.socketFactory.fallback", "false");
    
    //Session session= Session.getInstance(props);

    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication( **insert sender's mail address**, **put password link to the mail**);
        }                                 //addresse mail          mot de passe 
    });
     
    //Le message
    Message     message     = new MimeMessage(session);
    InternetAddress recipient   = new InternetAddress(dest);//***
    message.setRecipient(Message.RecipientType.TO, recipient);
    message.setSubject("Score au "+ gameName);
    message.setText(mes);
     
    //Transport
    Transport.send(message);
        }catch(NoSuchProviderException e) {
            System.err.println("Pas de transport disponible pour ce protocole");
            System.err.println(e);
        }
        catch(AddressException e) {
            System.err.println("Adresse invalide");
            System.err.println(e);
        }
        catch(MessagingException e) {
            System.err.println("Erreur dans le message");
            System.err.println(e);
        }
 
    }

}
