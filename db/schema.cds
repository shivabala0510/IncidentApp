namespace sap.customerincident;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

entity Customer : managed {

    key ID        : String(10);
        FirstName : String(30);
        LastName  : String(30);
        Name      : String = FirstName ||' '|| LastName;
        Email     : EMailAddress;
        Phone     : PhoneNumber;
        Incidents : Association to many Incident
                        on Incidents.customer = $self;
        addresses : Composition of many Addresses
                        on addresses.customer = $self;

}

entity Addresses : cuid, managed {
    customer      : Association to Customer;
    city          : String;
    postCode      : String;
    streetAddress : String;
}

entity Incident : cuid, managed {
    IncidentId   : String(10);
    customer     : Association to Customer;
    Description  : String(40);
    IncUrgency   : Association to Urgency;
    IncStatus    : Association to Status;
    conversation : Composition of many {
                       key ID        : UUID;
                           timestamp : type of managed : createdAt;
                           author    : type of managed : createdBy;
                           message   : String;
                   };
}

entity Status : CodeList {
    key code        : String enum {
            new = 'N';
            assigned = 'A';
            in_process = 'I';
            on_hold = 'H';
            resolved = 'R';
            closed = 'C';
        };
        criticality : Integer;
}

entity Urgency : CodeList {
    key code : String enum {
            high = 'H';
            medium = 'M';
            low = 'L';
        };
        criticality : Integer;
}

type EMailAddress : String;
type PhoneNumber  : String;
