query 6042367 FtaPBISalSalesPrices
{
    APIGroup = 'B365';
    APIPublisher = 'FiftytwoAS';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBISalSalesPrices';
    QueryType = API;

    elements
    {
        dataitem(SalesPrice; "Sales Price")
        {
            column(SalesType; "Sales Type")
            { }
            column(SalesCode; "Sales Code")
            { }
            column(ItemNo; "Item No.")
            { }
            column(VariantCode; "Variant Code")
            { }
            column(UnitofMeasureCode; "Unit of Measure Code")
            { }
            column(PriceIncludesVAT; "Price Includes VAT")
            { }
            column(CurrencyCode; "Currency Code")
            { }
            column(UnitPrice; "Unit Price")
            { }
            column(StartingDate; "Starting Date")
            { }
            column(EndingDate; "Ending Date")
            { }
        }
    }

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then SetRange(ItemNo, '');
    end;
}
