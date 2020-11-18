Class dc.Ens.Adapter.RegressionMLContextSearch Extends %ZEN.Portal.ContextSearch
{

ClassMethod GetModels(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
{
    Set sql = 
    "SELECT MODEL_NAME modelName FROM INFORMATION_SCHEMA.ML_TRAINED_MODELS "_
    "WHERE MODEL_TYPE = 'regression'"
    Set rset = ##class(%SQL.Statement).%ExecDirect(, sql)
    While(rset.%Next()) {
        Set modelName = rset.modelName
        Set pResults(modelName) = modelName
    }
    Return $$$OK
}

}
