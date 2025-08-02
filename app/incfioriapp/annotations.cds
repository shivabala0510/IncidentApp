using Processor as service from '../../srv/service';
using from '../../db/schema';

annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'IncidentId',
                Value : IncidentId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'customer_ID',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'IncUrgency_code',
                Value : IncUrgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'IncStatus_code',
                Value : IncStatus_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
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
            Value : customer.Name,
            Label : 'Customer',
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
        IncStatus_code,
        IncUrgency_code,
    ],
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
    )
};

annotate service.Incidents with {
    IncidentId @Common.Label : 'IncidentId'
};

annotate service.Incidents with {
    IncStatus @(
        Common.Label : 'IncStatus_code',
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
        )
};

annotate service.Incidents with {
    IncUrgency @(
        Common.Label : '{i18n>Incurgencycode}',
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
    )
};

annotate service.Status with {
    code @Common.Text : descr
};

annotate service.Urgency with {
    code @Common.Text : descr
};

