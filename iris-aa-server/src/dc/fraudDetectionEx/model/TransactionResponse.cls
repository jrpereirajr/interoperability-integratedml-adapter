Class dc.fraudDetectionEx.model.TransactionResponse Extends (%Persistent, Ens.Request)
{

Property IsFraud As %Boolean [ InitialExpression = 0 ];

Property Transaction As dc.fraudDetectionEx.model.Transaction;

Storage Default
{
<Data name="TransactionResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>IsFraud</Value>
</Value>
<Value name="3">
<Value>Transaction</Value>
</Value>
</Data>
<DataLocation>^dc.fraudDeDB4E.Transaction424CD</DataLocation>
<DefaultData>TransactionResponseDefaultData</DefaultData>
<IdLocation>^dc.fraudDeDB4E.Transaction424CD</IdLocation>
<IndexLocation>^dc.fraudDeDB4E.Transaction424CI</IndexLocation>
<StreamLocation>^dc.fraudDeDB4E.Transaction424CS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
