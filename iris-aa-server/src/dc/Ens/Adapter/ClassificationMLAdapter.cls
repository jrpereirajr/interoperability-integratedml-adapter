Class dc.Ens.Adapter.ClassificationMLAdapter Extends Ens.Adapter
{

Property Model As %String;

Property Request As %RegisteredObject;

Parameter SETTINGS = "Model:basic";

/// This user callback method is called just after %OnNew()
Method OnInit() As %Status
{
    Set status = $$$OK
    Try {
        Do ..ValidateSettings()
    } Catch(ex) {
        Set status = ex.AsStatus()
    }
	Quit status
}

/// This user callback method is called just before %OnClose()
Method OnTearDown() As %Status
{
	Quit $$$OK
}

Method ValidateSettings()
{
    Throw:(..Model = "") ##class(%Exception.General).%New("Classfication Model not defined.", $$$GeneralError)
}

Method Classify(pSampleRequest As %RegisteredObject) As dc.Ens.Adapter.ClassificationResult
{
    Set ..Request = pSampleRequest
    Set sqlSample = ..GetSampleFromRequest()
    Set sql = 
    "SELECT "_
        "PROBABILITY("_..Model_" FOR 1) AS Probability, "_
        "PREDICT("_..Model_") AS Predicted "_
    "FROM ("_sqlSample_")"
    Set rset = ##class(%SQL.Statement).%ExecDirect(, sql)
    
    Set result = ##class(dc.Ens.Adapter.ClassificationResult).%New()
    If (rset.%Next()) {
        Set result.Probability = rset.Probability
        Set result.Predicted = rset.Predicted
    }
    Return result
}

Method GetSampleFromRequest()
{
    $$$TOE(st, ..Request.%JSONExportToString(.sample))
    Set sample = {}.%FromJSON(sample)

    Set features = ""
    Set iter = sample.%GetIterator()
    while iter.%GetNext(.key, .value) {
        Set $List(features, * + 1) = value_" AS "_key
    }
    Set sqlSample = "SELECT "_$LTS(features, ", ")

    Return sqlSample
}

}
