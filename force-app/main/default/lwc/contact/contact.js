import { LightningElement,api,wire,track} from 'lwc';
import {getRecord, getFieldValue}from "lightning/uiRecordApi";
import accountName from "@salesforce/schema/Contact.Account.Name";
import rating from "@salesforce/schema/Contact.Account.Rating";
import contactName from "@salesforce/schema/Contact.Name";
import contacttitle from "@salesforce/schema/Contact.Title";
const fields = [accountName,rating,contactName,contacttitle]
export default class Contact extends LightningElement {

   @api recordId ;
   @wire(getRecord,{
      recordId: "$recordId",
      fields
   })
   account;
 
 
   
   get name(){
      if( getFieldValue(this.account.data,accountName)===''){
         
         return false;
      }
      else{
        return getFieldValue(this.account.data,accountName);
       
      }
   }
   
   get ratings(){
      return getFieldValue(this.account.data,rating);
   }
   
   get cname(){
      return  getFieldValue(this.account.data,contactName);
   }

   get title(){
      return  getFieldValue(this.account.data,contacttitle);

   }
}