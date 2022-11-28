query 6042361 FtaPBISalSalesperson
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'beta';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBISalSalesperson';

    elements
    {
        dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
        {
            column(Name; Name)
            { }
            column(Code; Code)
            { }
        }
    }

    var

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then CurrQuery.SetRange(Code, '');
    end;
}