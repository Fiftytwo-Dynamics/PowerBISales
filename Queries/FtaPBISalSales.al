query 6042363 "FtaPBISalSales"
{
    APIGroup = 'B365';
    APIPublisher = 'FiftytwoAS';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBISalSales';
    QueryType = API;

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(DocumentType; "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(BilltoCounty; "Bill-to County")
            {
            }
            column(BilltoCountryRegionCode; "Bill-to Country/Region Code")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(SelltoCounty; "Sell-to County")
            {
            }
            column(SelltoCountryRegionCode; "Sell-to Country/Region Code")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(ShipmentDate; "Shipment Date")
            {
            }
            column(RequestedDeliveryDate; "Requested Delivery Date")
            {
            }
            column(PromisedDeliveryDate; "Promised Delivery Date")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(YourReference; "Your Reference")
            { }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(CurrencyFactor; "Currency Factor")
            {
            }
            column(AmountIncludingVAT; "Amount Including VAT")
            {
            }
            column(AmtShipNotInvLCY; "Amt. Ship. Not Inv. (LCY)")
            {
            }
            column(CustomerDiscGroup; "Customer Disc. Group")
            {
            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {
            }
            column(CustomerPriceGroup; "Customer Price Group")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(OpportunityNo; "Opportunity No.")
            {
            }
            column(QuoteNo; "Quote No.")
            {
            }
            column(ReasonCode; "Reason Code")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Status; Status)
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = SalesHeader."Document Type", "Document No." = SalesHeader."No.";
                DataItemTableFilter = Type = const(Item);
                column(Type; Type)
                {
                }
                column(ItemNo; "No.")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(LocationCodeLine; "Location Code")
                {
                }
                column(UnitPrice; "Unit Price")
                { }
                column(UnitCostLCY; "Unit Cost (LCY)")
                { }
                column(LineDiscountAmount; "Line Discount Amount")
                { }
                column(AmountLine; Amount)
                { }
                column(AmountIncludingVATLine; "Amount Including VAT")
                { }
                column(InvDiscountAmountLine; "Inv. Discount Amount")
                { }
                column(LineAmount; "Line Amount")
                { }
                column(DimensionSetIDLine; "Dimension Set ID")
                { }
                column(VariantCode; "Variant Code")
                { }
                column(QtyperUnitofMeasure; "Qty. per Unit of Measure")
                { }
                column(UnitofMeasureCode; "Unit of Measure Code")
                { }
                column(ResponsibilityCenter; "Responsibility Center")
                { }
                column(ItemCategoryCode; "Item Category Code")
                { }
                column(QtyShippedBase; "Qty. Shipped (Base)")
                { }
                column(QtyInvoicedBase; "Qty. Invoiced (Base)")
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
