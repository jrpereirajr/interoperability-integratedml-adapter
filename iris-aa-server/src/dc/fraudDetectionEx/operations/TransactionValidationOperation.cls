Class dc.fraudDetectionEx.operations.TransactionValidationOperation Extends Ens.BusinessOperation
{

Property Adapter As dc.Ens.Adapter.ClassificationMLAdapter;

Parameter ADAPTER = "dc.Ens.Adapter.ClassificationMLAdapter";

Parameter INVOCATION = "Queue";

Method ValidateTransaction(pRequest As dc.fraudDetectionEx.model.TransactionRequest, Output pResponse As dc.fraudDetectionEx.model.TransactionResponse) As %Status
{
    Set pResponse = pRequest
    Set classificationResult = ..Adapter.Classify(pRequest.Transaction)
    Set pResponse.IsFraud = classificationResult.Predicted
    Return $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="dc.fraudDetectionEx.model.TransactionRequest">
        <Method>ValidateTransaction</Method>
    </MapItem>
</MapItems>
}

}
