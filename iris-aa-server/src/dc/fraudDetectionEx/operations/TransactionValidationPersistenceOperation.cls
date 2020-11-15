Class dc.fraudDetectionEx.operations.TransactionValidationPersistenceOperation Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method WriteToFile(pRequest As dc.fraudDetectionEx.model.TransactionRequest, Output pResponse As dc.fraudDetectionEx.model.TransactionResponse) As %Status
{
    Set obj = ""
    Set ts = $ZDT($H, 3)
    If ($IsObject(pRequest.Transaction)) {
        $$$TOE(st, pRequest.Transaction.%JSONExportToString(.obj))
    }

    Set pResponse = pRequest
    Set filename = "valid-transactions.txt" 

    Set line = ts_" : "_obj
    $$$QuitOnError(..Adapter.PutLine(filename, line))

    Set line = ts_" : "_pResponse.IsFraud
    $$$QuitOnError(..Adapter.PutLine(filename, line))

    $$$QuitOnError(..Adapter.PutLine(filename, " * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"))

    Return $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="dc.fraudDetectionEx.model.TransactionRequest">
        <Method>WriteToFile</Method>
    </MapItem>
</MapItems>
}

}
