query 6042369 FtaPBIDimSetEntry
{
    QueryType = API;
    APIPublisher = 'FiftytwoAS';
    APIGroup = 'B365';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBIDimSetEntry';

    elements
    {
        dataitem(Dimension_Set_Entry; "Dimension Set Entry")
        {
            column(DimensionSetID; "Dimension Set ID")
            {

            }
            column(DimensionCode; "Dimension Code")
            {

            }
            column(DimensionValueCode; "Dimension Value Code")
            {

            }
            column(DimensionValueID; "Dimension Value ID")
            {

            }
            column(DimensionName; "Dimension Name")
            {

            }
            column(DimensionValueName; "Dimension Value Name")
            {

            }
        }
    }

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then begin
                CurrQuery.SetRange(DimensionSetID, 0);
                CurrQuery.SetRange(DimensionCode, '');
            end;
    end;
}