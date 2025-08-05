using Processor as service from '../../srv/service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Incident ID',
                Value : IncidentId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Overview',
            ID : 'Overview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'General Information',
                    ID : 'GeneralInformation',
                    Target : '@UI.FieldGroup#GeneralInformation',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Incident Details',
                    ID : 'IncidentDetails',
                    Target : '@UI.FieldGroup#IncidentDetails',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Conversation',
                    ID : 'Conversation',
                    Target : 'conversation/@UI.LineItem#Conversation',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'IncidentId',
            Value : IncidentId,
        },
        {
            $Type : 'UI.DataField',
            Value : Description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : customer.FirstName,
            Label : 'Customer',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : IncStatus.descr,
            Criticality : IncStatus.criticality,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : IncUrgency.descr,
            Label : 'Urgency',
            Criticality : IncUrgency.criticality,
        },
    ],
    UI.SelectionFields : [
        IncidentId,
        IncStatus_code,
        IncUrgency_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : IncidentId,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : Description,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #IncidentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : IncUrgency_code,
                Label : 'Urgency',
            },
            {
                $Type : 'UI.DataField',
                Value : IncStatus_code,
                Label : 'Status',
            },
        ],
    },
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : IncidentId,
            },
            {
                $Type : 'UI.DataField',
                Value : Description,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : customer_ID,
                Label : 'Customer ',
            },
        ],
    },
);

annotate service.Incidents with {
    customer @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'FirstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'LastName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Email',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Phone',
                },
            ],
        },
        Common.Label : 'customer_ID',
        Common.Text : customer.Name,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Incidents with {
    IncidentId @Common.Label : 'IncidentId'
};

annotate service.Incidents with {
    IncStatus @(
        Common.Label : 'Status',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Status',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : IncStatus_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : IncStatus.descr,
        Common.Text.@UI.TextArrangement : #TextOnly,
        )
};

annotate service.Incidents with {
    IncUrgency @(
        Common.Label : 'Urgency',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Urgency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : IncUrgency_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Urgency',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : IncUrgency.descr,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Status with {
    code @Common.Text : descr
};

annotate service.Urgency with {
    code @Common.Text : descr
};

annotate service.Incidents.conversation with @(
    UI.LineItem #Conversation : [
        {
            $Type : 'UI.DataField',
            Value : author,
        },
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : 'Message',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : author,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversation Details',
            ID : 'ConversationDetails',
            Target : '@UI.Identification',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : 'Message',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
        },
    ],
);

annotate service.Customers with {
    Name @(
        Common.Label : 'Customer',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Name,
                    ValueListProperty : 'Name',
                },
            ],
            Label : 'Customer',
        },
        Common.ValueListWithFixedValues : false,
        Common.Text : FirstName,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Customers with {
    ID @(
        Common.Text : Name,
        Common.Text.@UI.TextArrangement : #TextFirst,
)};

annotate service.Customers with {
    FirstName @(
        Common.Text : Name,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

