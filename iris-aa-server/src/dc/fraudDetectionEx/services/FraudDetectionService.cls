Class dc.fraudDetectionEx.services.FraudDetectionService Extends Ens.BusinessService
{

Property Adapter As dc.fraudDetectionEx.adapters.TransactionInboundAdapter;

Parameter ADAPTER = "dc.fraudDetectionEx.adapters.TransactionInboundAdapter";

Method OnProcessInput(pInput As dc.fraudDetectionEx.model.Transaction, pOutput As %RegisteredObject) As %Status
{
    Set msg = ##class(dc.fraudDetectionEx.model.TransactionRequest).%New()
    Set msg.Transaction = pInput
    Return ..SendRequestAsync("ValidationProcess", msg)
}

}
