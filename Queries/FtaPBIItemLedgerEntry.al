query 6042301 FtaPBIItemLedgerEntry
{
    QueryType = Normal;

    elements
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(EntryNo; "Entry No.") //løbenummer
            {
            }
            column(ItemNo; "Item No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(SourceNo; "Source No.")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(LotNo; "Lot No.")
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
