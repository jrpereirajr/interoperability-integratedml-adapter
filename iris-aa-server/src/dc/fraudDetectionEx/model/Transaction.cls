Class dc.fraudDetectionEx.model.Transaction Extends (%Persistent, %JSON.Adaptor)
{

Parameter %JSONIGNOREINVALIDFIELD = 1;

Property Time As %Library.Integer(%JSONFIELDNAME = "TimeReference");

Property V1 As %Library.Double(%JSONFIELDNAME = "V1");

Property V2 As %Library.Double(%JSONFIELDNAME = "V2");

Property V3 As %Library.Double(%JSONFIELDNAME = "V3");

Property V4 As %Library.Double(%JSONFIELDNAME = "V4");

Property V5 As %Library.Double(%JSONFIELDNAME = "V5");

Property V6 As %Library.Double(%JSONFIELDNAME = "V6");

Property V7 As %Library.Double(%JSONFIELDNAME = "V7");

Property V8 As %Library.Double(%JSONFIELDNAME = "V8");

Property V9 As %Library.Double(%JSONFIELDNAME = "V9");

Property V10 As %Library.Double(%JSONFIELDNAME = "V10");

Property V11 As %Library.Double(%JSONFIELDNAME = "V11");

Property V12 As %Library.Double(%JSONFIELDNAME = "V12");

Property V13 As %Library.Double(%JSONFIELDNAME = "V13");

Property V14 As %Library.Double(%JSONFIELDNAME = "V14");

Property V15 As %Library.Double(%JSONFIELDNAME = "V15");

Property V16 As %Library.Double(%JSONFIELDNAME = "V16");

Property V17 As %Library.Double(%JSONFIELDNAME = "V17");

Property V18 As %Library.Double(%JSONFIELDNAME = "V18");

Property V19 As %Library.Double(%JSONFIELDNAME = "V19");

Property V20 As %Library.Double(%JSONFIELDNAME = "V20");

Property V21 As %Library.Double(%JSONFIELDNAME = "V21");

Property V22 As %Library.Double(%JSONFIELDNAME = "V22");

Property V23 As %Library.Double(%JSONFIELDNAME = "V23");

Property V24 As %Library.Double(%JSONFIELDNAME = "V24");

Property V25 As %Library.Double(%JSONFIELDNAME = "V25");

Property V26 As %Library.Double(%JSONFIELDNAME = "V26");

Property V27 As %Library.Double(%JSONFIELDNAME = "V27");

Property V28 As %Library.Double(%JSONFIELDNAME = "V28");

Property Amount As %Library.Currency(%JSONFIELDNAME = "Amount");

Storage Default
{
<Data name="TransactionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Time</Value>
</Value>
<Value name="3">
<Value>V1</Value>
</Value>
<Value name="4">
<Value>V2</Value>
</Value>
<Value name="5">
<Value>V3</Value>
</Value>
<Value name="6">
<Value>V4</Value>
</Value>
<Value name="7">
<Value>V5</Value>
</Value>
<Value name="8">
<Value>V6</Value>
</Value>
<Value name="9">
<Value>V7</Value>
</Value>
<Value name="10">
<Value>V8</Value>
</Value>
<Value name="11">
<Value>V9</Value>
</Value>
<Value name="12">
<Value>V10</Value>
</Value>
<Value name="13">
<Value>V11</Value>
</Value>
<Value name="14">
<Value>V12</Value>
</Value>
<Value name="15">
<Value>V13</Value>
</Value>
<Value name="16">
<Value>V14</Value>
</Value>
<Value name="17">
<Value>V15</Value>
</Value>
<Value name="18">
<Value>V16</Value>
</Value>
<Value name="19">
<Value>V17</Value>
</Value>
<Value name="20">
<Value>V18</Value>
</Value>
<Value name="21">
<Value>V19</Value>
</Value>
<Value name="22">
<Value>V20</Value>
</Value>
<Value name="23">
<Value>V21</Value>
</Value>
<Value name="24">
<Value>V22</Value>
</Value>
<Value name="25">
<Value>V23</Value>
</Value>
<Value name="26">
<Value>V24</Value>
</Value>
<Value name="27">
<Value>V25</Value>
</Value>
<Value name="28">
<Value>V26</Value>
</Value>
<Value name="29">
<Value>V27</Value>
</Value>
<Value name="30">
<Value>V28</Value>
</Value>
<Value name="31">
<Value>Amount</Value>
</Value>
</Data>
<DataLocation>^dc.fraudDetectDB4E.TransactionD</DataLocation>
<DefaultData>TransactionDefaultData</DefaultData>
<IdLocation>^dc.fraudDetectDB4E.TransactionD</IdLocation>
<IndexLocation>^dc.fraudDetectDB4E.TransactionI</IndexLocation>
<StreamLocation>^dc.fraudDetectDB4E.TransactionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
