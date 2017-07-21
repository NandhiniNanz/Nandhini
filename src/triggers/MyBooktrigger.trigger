trigger MyBooktrigger on Book__c (before insert) {
    Book__c[] books= Trigger.new;
    MyBook.discount(books);

}