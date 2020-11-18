Class dc.Ens.Adapter.RegressionMLAdapter Extends Ens.Adapter
{

Property Model As %String;

Property Request As %RegisteredObject;

Parameter SETTINGS = "Model:Basic:selector?context={dc.Ens.Adapter.RegressionMLContextSearch/GetModels}";

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

Method ValidateSettings()
{
    Throw:(..Model = "") ##class(%Exception.General).%New("Regression Model not defined.", $$$GeneralError)
}

Method Estimate(pSampleRequest As %RegisteredObject) As dc.Ens.Adapter.RegressionResult
{
    Set ..Request = pSampleRequest
    Set sqlSample = ..GetSampleFromRequest()
    Set sql = 
    "SELECT "_
        "PREDICT("_..Model_") AS Estimated "_
    "FROM ("_sqlSample_")"
    Set rset = ##class(%SQL.Statement).%ExecDirect(, sql)
    
    Set result = ##class(dc.Ens.Adapter.RegressionResult).%New()
    If (rset.%Next()) {
        Set result.Estimated = rset.Estimated
    }
    Return result
}

// todo: put it in an abstract class

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
