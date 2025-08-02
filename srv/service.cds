using {sap.customerincident as ci} from '../db/schema';


service Processor {
     @odata.draft.enabled: true
    entity Incidents as projection on ci.Incident;
   
    entity Customers as projection on ci.Customer;

}

service Administrator {
    @odata.draft.enabled: true
    entity Incidents as projection on ci.Incident;
    entity Customers as projection on ci.Customer;
}
