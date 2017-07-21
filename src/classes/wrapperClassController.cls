public class wrapperClassController {

     
    public List<cContact> contactList {get; set;}

    
    public List<cContact> getContacts() {
        if(contactList == null) {
            contactList = new List<cContact>();
            for(Contact c: [select Id, Name, Email, Phone from Contact limit 10]) {
               
                contactList.add(new cContact(c));
            }
        }
        return contactList;
    }


    public PageReference processSelected() {

                 
        List<Contact> selectedContacts = new List<Contact>();

        
        for(cContact cCon: getContacts()) {
            if(cCon.selected == true) {
                selectedContacts.add(cCon.con);
            }
        }

        
        System.debug('These are the selected Contacts...');
        for(Contact con: selectedContacts) {
            system.debug(con);
        }
        contactList=null;
        return null;
    }


    
    public class cContact {
        public Contact con {get; set;}
        public Boolean selected {get; set;}

        
        public cContact(Contact c) {
            con = c;
            selected = false;
        }
    }
}