query 6042368 FtaPBIItemBudgetEntries
{
    APIGroup = 'B365';
    APIPublisher = 'FiftytwoAS';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIItemBudgetEntries';
    QueryType = API;

    elements
    {
        dataitem(Item_Budget_Entry; "Item Budget Entry")
        {
            column(EntryNo; "Entry No.")
            {
            }
            column(BudgetName; "Budget Name")
            {

            }
            column(CostAmount; "Cost Amount")
            {

            }
            column(EntryDate; Date)
            {

            }
            column(Description; Description)
            {

            }
            column(DimensionSetID; "Dimension Set ID")
            {

            }
            column(ItemNo; "Item No.")
            {

            }
            column(LocationCode; "Location Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(SalesAmount; "Sales Amount")
            {

            }
            column(SourceNo; "Source No.")
            {

            }
        }
    }

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(EntryNo, 0);
    end;
}