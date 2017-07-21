public class EmailMissionSpecialistX {
    public void sendMail(String address, String subject, String body) {
      
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      String[] toAddresses = new String[] {'nandhini_a@preludesys.com'};
      mail.setToAddresses(toAddresses);
      mail.setSubject('TrailHead');
      mail.setPlainTextBody('Practice Mail');
      
      Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                new Messaging.SingleEmailMessage[] { mail });
      
      
      inspectResults(results);
   }

  
   private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
      Boolean sendResult = true;
     
      for (Messaging.SendEmailResult res : results) {
         if (res.isSuccess()) {
            System.debug('Email sent successfully');
         }
         else {
            sendResult = false;
            System.debug('The following errors occurred: ' + res.getErrors());                 
         }
      }
      return sendResult;
   }

}