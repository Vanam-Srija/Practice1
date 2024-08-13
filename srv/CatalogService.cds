using { anubhav.db.master, anubhav.db.transaction} from '../db/datamodel';

using {cappo.cds} from '../db/CDSViews';

service CatalogService @(path:'CatalogService'){
    entity EmployeeSet as projection on master.employees;
   // entity ProductSet  as projection on master.product;
    entity Products as projection on cds.CDSViews.ProductView;
    entity POs @(odata.draft.enabled: true) as projection on transaction.purchaseorder{
        *,
        Items,
        CASE OVERALL_STATUS
            when 'P' then 'Pending'
            when 'N' then 'New'
            when 'A' then 'Approved'
            when 'X' then 'Rejected'
            end as overallstatus : String(10),

        CASE OVERALL_STATUS
            when 'P' then 5 //Orange
            when 'N' then 2 //Blue
            when 'A' then 3 //Green
            when 'X' then 1  //Red
            end as ColorCode: Integer,
    }
   
    actions{
        @Common.SideEffects:{
         TargetProperties:[
            'in/GROSS_AMOUNT',
         ]
        }
        action boost() returns POs
    };
    function largestOrder() returns array of POs;
    entity POItems as projection on transaction.poitems;
}