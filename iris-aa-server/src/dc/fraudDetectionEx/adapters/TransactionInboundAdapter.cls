Class dc.fraudDetectionEx.adapters.TransactionInboundAdapter Extends Ens.InboundAdapter
{

Method OnInit() As %Status
{
    Quit $$$OK
}

Method OnTask() As %Status
{
    Set tSC = 1
    Try {
        Set data = ..GetData()
        Set transaction = ##class(dc.fraudDetectionEx.model.Transaction).%New()
        $$$ThrowOnError(transaction.%JSONImport(data))
        $$$ThrowOnError(..BusinessHost.ProcessInput(transaction))
    } Catch ex {
        Set tSC = ex.AsStatus()
    }
    Set ..BusinessHost.%WaitForNextCallInterval = 1
    Quit tSC
}

ClassMethod GetData() As %DynamicAbstractObject
{
    Set sql = "select %vid, JSON_OBJECT('TimeReference': TimeReference, 'V1': V1, 'V2': V2, 'V3': V3, 'V4': V4, 'V5': V5, 'V6': V6, 'V7': V7, 'V8': V8, 'V9': V9, 'V10': V10, 'V11': V11, 'V12': V12, 'V13': V13, 'V14': V14, 'V15': V15, 'V16': V16, 'V17': V17, 'V18': V18, 'V19': V19, 'V20': V20, 'V21': V21, 'V22': V22, 'V23': V23, 'V24': V24, 'V25': V25, 'V26': V26, 'V27': V27, 'V28': V28, 'Amount': Amount) jsonTransaction from ("_
        "select * from SQLUser.CreditCardTest"_
        ") where %vid = ?"
    Set id = $Random(50)
    Set rset = ##class(%SQL.Statement).%ExecDirect(, sql, id)
    Do rset.%Next()
    Return {}.%FromJSON(rset.jsonTransaction)
}

}
