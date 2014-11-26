package com.js.email.enquiry;

import java.util.Arrays;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.event.MessageCountEvent;
import javax.mail.event.MessageCountListener;
import javax.mail.internet.InternetAddress;
import javax.mail.search.FlagTerm;

import com.js.controller.WebEnquiryController;
import com.js.dto.WebEnquiryDTO;
import com.js.exception.JSIException;
import com.sun.mail.imap.IMAPFolder;

public class EmailUtil {
	private String user = null;
	private String password = null;
	private IMAPFolder inbox = null;
	private Store store = null;
	Thread t = new Thread(new Runnable() {
		public void run() {
			try {
				if (inbox == null)
					return;
				while (true) {
					inbox.idle();
				}
			} catch (Exception ex) {
				new JSIException(ex).log();
				// Handling exception goes here
			}
		}
	});

	public EmailUtil(String user, String password) {
		this.user = user;
		this.password = password;
	}

	public static void main(String args[]) throws Exception {

		// EmailUtil util = new EmailUtil("contact@jsinformatics.com",
		// "!@#$%6789");
		// EmailUtil util = new EmailUtil("bhoopendra.java@gmail.com",
		// "java6587");
		// util.getEmailDetails();
		// util.searchEmails("contact@jsinformatics.com");
		/*
		 * String body =
		 * AppUtil.readStreamIntoStringUsingReader(EmailUtil.class.
		 * getResourceAsStream("/just_dial_email_template.txt")); User user =
		 * justDailEmailParser(body); System.err.println(user); body =
		 * AppUtil.readStreamIntoStringUsingReader
		 * (EmailUtil.class.getResourceAsStream
		 * ("/sulekha_email_template.txt"));// just_dial_email_template user =
		 * shulekhaEmailParser(body); System.err.println(user);
		 */
		// String body =
		// AppUtil.readStreamIntoStringUsingReader(EmailUtil.class.getResourceAsStream("/odesk_email_template.txt"));
		// System.err.println(odeskEmailParser(body));

		String body = AppUtil.readStreamIntoStringUsingReader(EmailUtil.class
				.getResourceAsStream("/icici_email_template.txt"));
		System.err.println(iciciEmailParser(body));
	}

	public void getEmailDetails() {
		String host = "imap.gmail.com";
		Properties properties = new Properties();
		properties.setProperty("mail.store.protocol", "imaps");
		try {
			Session session = Session.getInstance(properties, null);
			store = session.getStore();
			store.connect(host, user, password);
			inbox = (IMAPFolder) store.getFolder("Inbox");
			inbox.open(Folder.READ_ONLY);
			inbox.addMessageCountListener(messageCountListener);
			t.start();
		} catch (Exception ex) {
			new JSIException(ex).log();
			ex.printStackTrace();
		}
	}

	public void removeMessageCountListener() {
		inbox.removeMessageCountListener(messageCountListener);
	}

	public void closeConnection() {
		removeMessageCountListener();
		try {
			inbox.close(true);
			store.close();
		} catch (Exception e) {
			new JSIException(e).log();
			JsiLogger.err(getClass(), e.getMessage());
		}

	}

	MessageCountListener messageCountListener = new MessageCountListener() {

		public void messagesAdded(MessageCountEvent messageCountEvent) {

			System.out.println("messagesAdded");
			Message[] messages = messageCountEvent.getMessages();
			for (Message message : messages) {
				try {
					System.out.println(message.getSubject());
					System.out.println(message.getContent().toString());
					BodyPart bodyPart = null;
					String body = null;
					if (message.getContent() instanceof Multipart) {
						Multipart multipart = (Multipart) message.getContent();
						bodyPart = multipart.getBodyPart(0);
						if (bodyPart.isMimeType("text/*")) {
							body = (String) bodyPart.getContent();
							body = body.substring(0, body.length() - 2);
							System.out.println("Content : " + body);
						}
					}

					for (Address address : message.getFrom()) {
						String addressStr = address.toString();
						String enquiryEmails[] = PropertyLoader
								.getProperty(
										PropertyLoader.KEY_EMAIL_CONTACT_EMAIL_ENQUIRY)
								.toLowerCase().split(",");
						String paymentEmails[] = PropertyLoader
								.getProperty(
										PropertyLoader.KEY_EMAIL_CONTACT_EMAIL_PAYMENT)
								.toLowerCase().split(",");
						JsiLogger
								.log(getClass(), "From: " + address.toString());
						if (AppUtil.isContainInArray(enquiryEmails, addressStr)) {
							JsiLogger.log(getClass(), "Email is for enquiry.");
							
							WebEnquiryDTO dto = new WebEnquiryDTO();
							dto.setReferance("Just Dail website");
							User user = justDailEmailParser(body);
							if (user == null || (user.getEmail() == null)) {
								user = shulekhaEmailParser(body);
								dto.setReferance("Sulekha website");
							}
							if (user != null) {
								dto.setContactno(user.getMobile());
								dto.setEmail(user.getEmail());
								dto.setName(user.getName());
								try{
									System.out.println("\n\n"+dto+"\n\n");
									new WebEnquiryController().saveWebInquiry(dto);
								}catch(Throwable th){
									new JSIException(th).log();
								}
							}
							System.err
									.println(user.getName()
											+ " Is user name contain new line char(s): "
											+ AppUtil.isContain(user.getName(),
													AppUtil.PATTERN_NEW_LINE));
						} else if (AppUtil.isContainInArray(paymentEmails,
								addressStr)) {
							JsiLogger.log(getClass(), "Email is for payment.");
						}
					}

				} catch (Exception ex) {
					new JSIException(ex).log();
					ex.printStackTrace();
				}
			}
			/*
			 * try { Message message =
			 * inbox.getMessages()[inbox.getMessageCount() - 1];
			 * System.err.println(message.getSubject()); } catch (Exception e) {
			 * JsiLogger.err(e); }
			 */
			t.start();
		}

		public void messagesRemoved(MessageCountEvent messageCountEvent) {
			JsiLogger.log(getClass(), "messagesRemoved");
			/*
			 * System.out.println("messagesRemoved"); Message[] messages =
			 * messageCountEvent.getMessages(); for (Message message : messages)
			 * { try { System.out.println(message.getSubject()); } catch
			 * (Exception ex) { ex.printStackTrace(); } }
			 */
			t.start();
		}
	};

	public void searchEmails(String id) throws Exception {
		// EmailDTO emailDTO = new EmailDTO();
		id = id.replace("\'", "");
		id = id.replace("`", "");
		// emailDTO.setEmail_id(id);
		BodyPart bodyPart = null;
		Flags seen = new Flags(Flags.Flag.USER);
		FlagTerm unseenFlagTerm = new FlagTerm(seen, true);
		Message[] messages = inbox.search(unseenFlagTerm);
		Address searchFrom = new InternetAddress(id);

		for (int i = messages.length - 1; i > 0; i--) {
			Message message = messages[i];
			if (Arrays.asList(message.getFrom()).contains(searchFrom)
					&& message.getContent() instanceof Multipart) {
				Multipart multipart = (Multipart) message.getContent();
				bodyPart = multipart.getBodyPart(0);
				if (bodyPart.getContentType().toLowerCase().contains("text/")) {
					String s = (String) bodyPart.getContent();
					s = s.substring(0, s.length() - 2);
					// emailDTO.setEmail_content(s.substring(0, s.length() -
					// 2));
					// System.out.println("Content : " + s.substring(0,
					// s.length() - 2));
					
					System.out.println("Subject : " + message.getSubject());
					User user = justDailEmailParser(s);
					
					if (user == null || (user.getEmail() == null)) {
						user = shulekhaEmailParser(s);
						
					}
					System.out.println("Content : " + user.toString());
					
					// emailDTO.setEmail_subject(message.getSubject());
					// new EmailDAO().saveEmailDetails(emailDTO);
				}
			}
		}
	}

	public static User shulekhaEmailParser(String body) {
		User user = null;
		if (body != null) {
			user = new User();
			if (body.contains("Customer's Name")) {
				try {
					user.setName(AppUtil.removeStar(AppUtil.removeColon(AppUtil
							.removeNewLineChars(body.substring(
									body.indexOf("Customer's Name") + 15,
									body.indexOf("   Looking")).trim()))));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Customer's Name") + ", "
									+ body.indexOf("   Looking")
									+ "]. Detail: " + e.getMessage());
				}
			}
			if (body.contains("Email id")) {
				try {
					user.setEmail(AppUtil.removeStar(AppUtil
							.removeColon(AppUtil.removeNewLineChars(body
									.substring(body.indexOf("Email id") + 8,
											body.indexOf("Mobile")).trim()))));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Email id") + ", "
									+ body.indexOf("Mobile") + "]. Detail: "
									+ e.getMessage());
				}
			}
			if (body.contains("Mobile:")) {
				try {
					user.setMobile(AppUtil.removeStar(AppUtil.removeColon(AppUtil
							.removeNewLineChars(body.substring(
									body.indexOf("Mobile") + 6,
									body.indexOf("Mobile") + 20).trim()))));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Mobile") + ", "
									+ body.indexOf("Mobile") + "]. Detail: "
									+ e.getMessage());
				}
			}
			if (body.contains("For")) { // Looking For:
				try {
					user.setEnquiryType(AppUtil.removeStar(AppUtil.removeColon(AppUtil
							.removeNewLineChars(body.substring(
									body.indexOf("For") + 3,
									body.indexOf("Preferences")).trim()))));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("For:") + ", "
									+ body.indexOf("   Looking")
									+ "]. Detail: " + e.getMessage());
				}
			}
			if (body.contains("Preferences")) {
				try {
					user.setPreferences(AppUtil.removeStar(AppUtil
							.removeColon(body.substring(
									body.indexOf("Preferences") + 11,
									body.indexOf("Contact details of ")).trim())));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Preferences") + ", "
									+ body.indexOf("Contact details of ")
									+ "]. Detail: " + e.getMessage());
				}
			}
		}

		return user;
	}

	public static User justDailEmailParser(String body) {
		String bodyC = body.toLowerCase();
		User user = null;
		// email=akashsol602@gmail.com*, name=Mr Akash from Old Palasia,
		// mobile=Phone:*+9188, preferences=Sun, 07,
		// enquiryType=ComputerTraining
		// Institutes
		if (body != null) {
			user = new User();
			if (body.contains("Caller Name")) {
				try {
					String username = AppUtil.removeNewLineChars(body
							.substring(body.indexOf("Caller Name") + 12,
									body.indexOf("Caller Requirement") - 1)
							.trim());

					user.setName(AppUtil.removeStar(AppUtil
							.removeColon(username)));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Caller Name") + ", "
									+ body.indexOf("Caller Requirement")
									+ "]. Detail " + e.getMessage());
				}
			}
			if (body.contains("Caller Email")) {
				try {
					String email = AppUtil.removeNewLineChars(body.substring(
							body.indexOf("Caller Email") + 13,
							body.indexOf("Call Date & Time") - 1).trim());

					user.setEmail(AppUtil.removeStar(AppUtil.removeColon(email)));

				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Caller Email") + ", "
									+ body.indexOf("Call Date & Time")
									+ "]. Detail: " + e.getMessage());
				}
			}
			if (body.contains("Caller Phone")) {
				try {
					String contactNo = AppUtil.removeNewLineChars(body
							.substring(body.indexOf("Caller Phone") + 12,
									body.indexOf("Caller Phone") + 30).trim());

					user.setMobile(AppUtil.removeStar(AppUtil
							.removeColon(contactNo)));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Caller Phone") + ", "
									+ body.indexOf("Caller Phone")
									+ "]. Detail: " + e.getMessage());
				}
			}
			if (body.contains("Caller Requirement")) {
				try {
					user.setEnquiryType(AppUtil.removeStar(AppUtil.removeColon(AppUtil
							.removeNewLineChars(body.substring(
									body.indexOf("Caller Requirement") + 19,
									body.indexOf("Caller Phone") - 1).trim()))));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Caller Requirement") + ", "
									+ body.indexOf("Caller Phone")
									+ "]. Detail: " + e.getMessage());
				}
			}
			if (body.contains("Call Date & Time")) {
				try {
					user.setPreferences(AppUtil.removeNewLineChars(body
							.substring(body.indexOf("Call Date & Time") + 19,
									body.indexOf("Call Date & Time") + 26)
							.trim()));
				} catch (Exception e) {
					new JSIException(e).log();
					JsiLogger
							.err("Error while email parsing for Name, indices["
									+ body.indexOf("Call Date & Time:") + ", "
									+ body.indexOf("Call Date & Time:")
									+ "]. Detail: " + e.getMessage());
				}
			}
		}

		return user;
	}

	public static String odeskEmailParser(String body) {
		String contentToBeReturned = body;
		if (StringUtil.isNotBlank(contentToBeReturned)
				&& contentToBeReturned.contains("We have processed your")) {
			contentToBeReturned = contentToBeReturned.substring(
					contentToBeReturned.indexOf("We have processed your"),
					contentToBeReturned.indexOf("(*) This amount does not"))
					.trim();
		}
		return contentToBeReturned;
	}

	public static String iciciEmailParser(String body) {
		String contentToBeReturned = body;
		if (StringUtil.isNotBlank(contentToBeReturned)
				&& contentToBeReturned
						.contains("You have used your Debit Card")) {
			contentToBeReturned = contentToBeReturned
					.substring(
							contentToBeReturned
									.indexOf("You have used your Debit Card"),
							contentToBeReturned
									.indexOf("If you have not made this transaction"))
					.trim();
		}
		return contentToBeReturned;
	}
}
