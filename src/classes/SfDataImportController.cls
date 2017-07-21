public class SfDataImportController
{
    public String userName {get;set;}   
    public String passWord {get;set;}
    public String securityToken {get;set;}  
    public String objectName {get;set;}
    public String[] objNames = new String[]{'None'};
    public List<String> fieldNames = new List<String>();
    set<string> setFieldNames = new set<string>();
    //string[] fieldNames = new string[]{};
    public List<String> availableFieldNames = new List<String>();
    public sobjectPartnerSoapSforceCom.sObject_x[] values;  
    public List<String> output {get; set;}
    public integer i {get;set;}
    public integer j = 0;
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public List<WrapperClass> wrapAccountList {get; set;}
    //public List<string> inputvalues;  
    public string[] inputvalues;
    public Map<string,string> matchedNames;
    
    /* String array for select box(Fields) */
    String[] selectedFields = new String[]{};
    String[] checkedFields = new String[]{};
   
    public partnerSoapSforceCom.Soap con = new partnerSoapSforceCom.Soap();
   
    public void login()
    {
        if(checkLogin())
        {
            retrieveObjects();
           
         
        }
    }
    
    public void fetchCsvColumns()
    {
         system.debug('***blob'+csvFileBody);
         system.debug('***fieldNames'+fieldNames);
         matchedNames = new Map<string,string>();
         
         csvAsString = csvFileBody.toString();
         csvFileLines = csvAsString.split('\n');
         List<sobject> recstoMap = new List<sobject>();
         
         for(Integer i=0; i<fieldNames.size(); i++)
         {
             //String[] inputvalues = new String[]{};
             //inputvalues = new List<string>(); 
             inputvalues = new String[]{};
             setFieldNames.addall(fieldNames);
             inputvalues = csvFileLines [0].split(',');
             
             for(integer j=0;j<inputvalues.size();j++)
             {
                 if(setFieldNames.contains(inputvalues[j]))
                 {
                 system.debug('@@@'+inputvalues[j]);
                 for(string str : fieldNames)
                     {
                         if(str == inputvalues[j])   
                         {
                             matchedNames.put(str,inputvalues[j]);
                             system.debug('***matchedNames1'+matchedNames);
                         }
                        /* else
                         {
                             matchedNames.put(str,'');
                             system.debug('***matchedNames2'+matchedNames);
                         }*/
                     }
                 }
             }
             system.debug('***inputvalues '+inputvalues );
             system.debug('***matchedNamesvalues'+matchedNames.keyset());
             system.debug('***matchedNamesvalues'+matchedNames.values());
         }
    }
   
    public boolean checkLogin()
    {
        try
        {                                 
            partnerSoapSforceCom.LoginResult loginResult = con.login(username, (password+securityToken));                   
            con.SessionHeader = new partnerSoapSforceCom.SessionHeader_element();       
            con.endpoint_x =loginResult.ServerUrl;       
            con.Sessionheader.sessionid = loginResult.sessionid;
        }
        catch(Exception e)
        {
        }
        return true;
     }
    
     /* Retrieving all the objects */
     public void retrieveObjects()
     {
         if(checkLogin())
         {
             partnerSoapSforceCom.DescribeGlobalresult sobjectResults = con.describeGlobal();
             partnerSoapSforceCom.DescribeGlobalSObjectResult[] objects = sobjectResults.sobjects;        
             for(partnerSoapSforceCom.DescribeGlobalSObjectResult tmpRes:objects)
             {
                 objNames.add(tmpRes.Name);
             }
         }
     }
    
     /* Getting the selected object name */
     public String getobjectName()    
     {     
         return objectName;   
     }       
     public void setobjectName(String obj)    
     {     
         this.objectName = objectName;    
     }
     
     public List<SelectOption> getobjectNames()   
     {         
         List<SelectOption> options = new List<SelectOption>();
         for(String temp:objNames)
         {    
         options.add(new SelectOption(temp,temp));
         }     
         return options;   
     }
    
     public void showFields()
     {
         if(checkLogin())
         {
             partnerSoapSforceCom.DescribeSObjectResult descObjRes = con.describeSObject(objectName);
             partnerSoapSforceCom.Field[] fields = descObjRes.Fields;
             for(partnerSoapSforceCom.Field tmpRes:fields)
             {
                 fieldNames.add(tmpRes.Name);               
             }                    
         }        
     }
    
     /* Getting the all the field names */
     public List<String> getselectedFields()    
     {     
         return selectedFields;   
     }       
     public void setselectedFields(List<String> selectedFields)    
     {     
         this.selectedFields = selectedFields;   
     }
          
     public List<SelectOption> getfields()   
     {         
         List<SelectOption> options = new List<SelectOption>();
         fieldNames.sort();
         for(String temp:fieldNames)
         {    
         options.add(new SelectOption(temp,temp));
         }     
         return options;   
     }
    
     /* Getting the all the field names */
     public List<String> getcheckedFields()    
     {     
         return checkedFields;   
     }       
     public void setcheckedFields(List<String> checkedFields)    
     {     
         this.checkedFields = checkedFields;   
     }
          
     public List<SelectOption> getfieldsAvailable()   
     {         
         availableFieldNames.sort();
         List<SelectOption> options = new List<SelectOption>();
         for(String temp:availableFieldNames)
         {    
             options.add(new SelectOption(temp,temp));
         }     
         return options;   
     }
    
     public void addFields()
     {
         for(String tmp:selectedFields)
         {
             availableFieldNames.add(tmp);
             for(i = 0; i<fieldNames.size(); i++)
             {
                 if(fieldNames[i] == tmp)
                 {
                     fieldNames.remove(i);
                     break;
                 }
             }                         
         }
     }   
    
     public void removeFields()
     {
         integer i;
         for(String tmp:checkedFields)
         {
             fieldNames.add(tmp);
             for(i = 0; i<availableFieldNames.size(); i++)
             {
                 if(availableFieldNames[i] == tmp)
                 {
                     availableFieldNames.remove(i);
                     break;
                 }
             }                         
         }
     }
     public void fetch()
     {
         
         if(checkLogin())
         {
             integer availableFieldNamesLen = availableFieldNames.size();
             String fieldsToQuery = '';
             for(String temp:availableFieldNames)
             {
                 if(j != (availableFieldNameslen - 1))
                 {
                     fieldsToQuery = fieldsToQuery + temp + ',';
                 }
                 else
                 {
                     fieldsToQuery = fieldsToQuery + temp;
                 }                
                 j = j +1;
             }
             String sql = 'SELECT ' + fieldsToQuery + ' FROM ' + objectName;              
                
        
             /*-----------------------------------
             Login via SOAP/XML web service api
            -----------------------------------*/
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://www.salesforce.com/services/Soap/u/22.0');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
            request.setHeader('SOAPAction', '""');
            /*not escaping username and password because we're setting those variables above
            in other words, this line "trusts" the lines above
            if username and password were sourced elsewhere, they'd need to be escaped below*/
            request.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + userName+ '</username><password>' + passWord + securityToken + '</password></login></Body></Envelope>');
            Dom.XmlNode resultElmt = (new Http()).send(request).getBodyDocument().getRootElement()
              .getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/')
              .getChildElement('loginResponse', 'urn:partner.soap.sforce.com')
              .getChildElement('result', 'urn:partner.soap.sforce.com');
   
            /*-------------------------------
             Grab session id and server url
            --------------------------------*/
            final String SERVER_URL = resultElmt.getChildElement('serverUrl', 'urn:partner.soap.sforce.com') .getText().split('/services')[0];
            final String SESSION_ID = resultElmt.getChildElement('sessionId', 'urn:partner.soap.sforce.com') .getText();
   
            /*----------------------------------
             Load first 20 accounts via REST API
            ---------------------------------*/
            final PageReference theUrl = new PageReference(SERVER_URL + '/services/data/v22.0/query/');
            theUrl.getParameters().put('q',sql);
            request = new HttpRequest();
            request.setEndpoint(theUrl.getUrl());
            request.setMethod('GET');
            request.setHeader('Authorization', 'OAuth ' + SESSION_ID);
   
            String body = (new Http()).send(request).getBody();
   
            JSONParser parser = JSON.createParser(body);
   
            do
            {
                parser.nextToken();
            }
            while(parser.hasCurrentToken() && !'records'.equals(parser.getCurrentName()));
   
            parser.nextToken();
   
            List<String> tmpOutput = (List<String>) parser.readValueAs(List<String>.class); 
            //output = tmpOutput;                   
            List<String> tempoutput = new List<String>();
            for(String tmp:tmpOutput)
            {
                if(tmp != null)
                {
                    if(!tmp.contains('attributes') && !tmp.contains('type') && !tmp.startsWith('/services/data/v22.0') && !tmp.contains('url') && tmp != objectName && !tmp.contains('{') && !tmp.contains('}'))
                    {
                        tempoutput.add(tmp);
                    }
                }
            }
            output = tempoutput;
        } 
     } 
     
     public List<WrapperClass> getWrapperList()
     {
         wrapAccountList = new List<WrapperClass>();
         if(fieldNames.size() > 0)
         {
             system.debug('***fieldNames'+fieldNames);
             for(string strVal : fieldNames)
             {
                 wrapAccountList.add(New WrapperClass(false,strVal ,''));
             }
            
            //system.debug('***matchedNames'+matchedNames); 
            //system.debug('***matchedNames'+matchedNames.values());
            /*for(string strMapval : matchedNames.keyset())
            {
                 string mapvalue = matchedNames.get(strMapval);
                 wrapAccountList.add(New WrapperClass(false,strMapval ,strMapval ));
            }*/
            
            /*for(string strMapval : matchedNames.values())
            {
                 string mapvalue = matchedNames.get(strMapval);
                 wrapAccountList.add(New WrapperClass(false,strMapval ,strMapval ));
            }*/

         }
         
         system.debug('***wrapAccountList'+wrapAccountList);
         return wrapAccountList;
     }
     
     Public Class WrapperClass
     {
         Public string objFields {get;set;}
         Public string csvClmn {get;set;}
         Public Boolean selected{get;set;}
        
         Public WrapperClass(boolean sltBox,string objFlds,string csvFlds)
         {
            selected = SltBox;
            objFields = objFlds;
            csvClmn = csvFlds;
          }
     }
}