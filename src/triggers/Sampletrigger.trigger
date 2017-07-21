trigger Sampletrigger on Contact (before insert) {
    for(Contact con:Trigger.new){
        con.Description ='Contact created successfully';
    }

}