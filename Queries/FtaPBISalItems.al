query 6042364 FtaPBISalItems
{
    APIGroup = 'B365';
    APIPublisher = 'FiftytwoAS';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBISalItems';
    QueryType = API;

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            { }
            column(Type; Type)
            { }
            column(Description; Description)
            { }
            column(BaseUnitofMeasure; "Base Unit of Measure")
            { }
            column(TariffNo; "Tariff No.")
            { }
            column(ItemCategoryCode; "Item Category Code")
            { }
            column(GenProdPostingGroup; "Gen. Prod. Posting Group")
            { }
            column(InventoryPostingGroup; "Inventory Posting Group")
            { }
            column(CountryRegionofOriginCode; "Country/Region of Origin Code")
            { }
            column(NetWeight; "Net Weight")
            { }
            column(GrossWeight; "Gross Weight")
            { }
            column(ItemDiscGroup; "Item Disc. Group")
            { }
            column(UnitVolume; "Unit Volume")
            { }
            column(UnitPrice; "Unit Price")
            { }
            dataitem(ItemVariant; "Item Variant")
            {
                DataItemLink = "Item No." = Item."No.";
                SQLJoinType = LeftOuterJoin;

                column(Code; Code)
                { }
                column(VariantDescription; Description)
                { }
            }
        }
    }

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(No, '');
    end;
}
