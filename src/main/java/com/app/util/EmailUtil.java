package com.app.util;

// Java utility class for email sending

import java.util.Properties;

// JavaMail imports
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	/*
	 * Email address from which all emails will be sent
	 *
	 * Example: securebank.project@gmail.com
	 */
	private static final String FROM_EMAIL = "udhaynayyar80@gmail.com";

	/*
	 * Gmail App Password
	 *
	 * NOT your normal Gmail password.
	 *
	 * Generate from: Google Account → Security → App Passwords
	 */
	private static final String APP_PASSWORD = "jdkc uqha exfq iaeg";

	/*
	 * Static method because we don't need to create an EmailUtil object.
	 *
	 * Usage:
	 *
	 * EmailUtil.sendEmail( "abc@gmail.com", "Subject", "Message Body" );
	 */
	public static void sendEmail(String to, String subject, String body) {

		/*
		 * SMTP configuration
		 *
		 * SMTP = Simple Mail Transfer Protocol
		 *
		 * This tells Java: Which mail server should be used
		 */
		Properties props = new Properties();

		// Gmail requires authentication
		props.put("mail.smtp.auth", "true");

		// Gmail uses TLS security
		props.put("mail.smtp.starttls.enable", "true");

		// Gmail SMTP server
		props.put("mail.smtp.host", "smtp.gmail.com");

		// Gmail TLS port
		props.put("mail.smtp.port", "587");

		/*
		 * Create a mail session.
		 *
		 * Session contains: username + password smtp settings
		 */
		Session session = Session.getInstance(props,

				new Authenticator() {

					/*
					 * Called automatically by JavaMail when Gmail asks:
					 *
					 * "Who are you?"
					 */
					protected PasswordAuthentication getPasswordAuthentication() {

						return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
					}
				});

		try {

			/*
			 * Create actual email object
			 */
			Message message = new MimeMessage(session);

			/*
			 * Sender email
			 */
			message.setFrom(new InternetAddress(FROM_EMAIL));

			/*
			 * Receiver email
			 */
			message.setRecipients(Message.RecipientType.TO,

					InternetAddress.parse(to));

			/*
			 * Subject line
			 */
			message.setSubject(subject);

			/*
			 * Email body
			 */
			message.setText(body);

			/*
			 * Send email
			 */
			Transport.send(message);

			System.out.println("Email sent successfully");

		} catch (Exception e) {

			System.out.println("Email sending failed");

			e.printStackTrace();
		}
	}
}