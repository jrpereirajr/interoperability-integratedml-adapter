Class dc.fraudDetectionEx.model.TransactionRequest Extends (%Persistent, Ens.Request)
{

Property IsFraud As %Boolean [ InitialExpression = 0 ];

Property Transaction As dc.fraudDetectionEx.model.Transaction;

Property SerializedTransaction As %String(MAXLEN = "") [ Private ];

Method SerializedTransactionGet() As %String
{
    Do ..Transaction.%JSONExportToString(.json)
    Return json
}

Method SerializedTransactionSet(value) As %Status
{
    Set i%SerializedTransaction = value
    Return $$$OK
}

Storage Default
{
<Data name="TransactionRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>IsFraud</Value>
</Value>
<Value name="3">
<Value>Transaction</Value>
</Value>
<Value name="4">
<Value>SerializedTransaction</Value>
</Value>
</Data>
<DataLocation>^dc.fraudDeDB4E.Transaction108DD</DataLocation>
<DefaultData>TransactionRequestDefaultData</DefaultData>
<IdLocation>^dc.fraudDeDB4E.Transaction108DD</IdLocation>
<IndexLocation>^dc.fraudDeDB4E.Transaction108DI</IndexLocation>
<StreamLocation>^dc.fraudDeDB4E.Transaction108DS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
