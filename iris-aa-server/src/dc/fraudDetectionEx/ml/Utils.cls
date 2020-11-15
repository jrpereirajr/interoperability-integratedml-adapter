Include %occErrors

Class dc.fraudDetectionEx.ml.Utils Extends %RegisteredObject
{

ClassMethod Setup() As %Status
{
    Write "Setup for ML features in examples",!
    Do ..CreateViews()
    Do ..CreateMLModel()
    Do ..CheckModel()
    Write "Finish",!
}

ClassMethod ValidateSQLExecution(pSQLCODE)
{
    Throw:((pSQLCODE '= 0) && (pSQLCODE '= 100)) ##class(%Exception.SQL).CreateFromSQLCODE(pSQLCODE, "")
}

ClassMethod CreateViews() As %Status
{
    Write "Creating views... ",!

    Write "  CreditCardBalanced... "
    &SQL(
    CREATE OR REPLACE VIEW SQLUser.CreditCardBalanced AS 
    SELECT TOP 200 TimeReference,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25,V26,V27,V28,Amount,Response FROM SQLUser.CreditCard WHERE Response = 1 
    UNION 
    SELECT TOP 200 TimeReference,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25,V26,V27,V28,Amount,Response FROM SQLUser.CreditCard WHERE Response = 0
    )
    Do ..ValidateSQLExecution(SQLCODE)
    Write "ok",!

    Write "  CreditCardTrain... "
    &SQL(
    CREATE OR REPLACE VIEW SQLUser.CreditCardTrain AS 
    SELECT TOP 75 * FROM SQLUser.CreditCardBalanced WHERE Response = 1 
    UNION 
    SELECT TOP 75 * FROM SQLUser.CreditCardBalanced WHERE Response = 0
    )
    Do ..ValidateSQLExecution(SQLCODE)
    Write "ok",!

    Write "  CreditCardTest... "
    &SQL(
    CREATE OR REPLACE VIEW SQLUser.CreditCardTest AS 
    SELECT TOP 25 * FROM SQLUser.CreditCardBalanced WHERE Response = 1 
    UNION 
    SELECT TOP 25 * FROM SQLUser.CreditCardBalanced WHERE Response = 0
    )
    Do ..ValidateSQLExecution(SQLCODE)
    Write "ok",!
}

ClassMethod CreateMLModel() As %Status
{
    Write "Creating ML model... ",!

    Try {
        Write "  Removing previous model... "
        &SQL(DROP MODEL CredCardFraudModel)
        Write "ok",!
    } Catch(ex) {}

    Write "  Creating model... "
    &SQL(CREATE MODEL CredCardFraudModel PREDICTING (Response) FROM SQLUser.CreditCardTrain)
    Do ..ValidateSQLExecution(SQLCODE)
    Write "ok",!

    Write "  Training the model... "
    &SQL(TRAIN MODEL CredCardFraudModel)
    Do ..ValidateSQLExecution(SQLCODE)
    Write "ok",!
}

ClassMethod CheckModel() As %Status
{
    Write "Checking the ML model... "
    Set attempt = 0
    Do {
        &SQL(SELECT Count(*) INTO :isOK FROM INFORMATION_SCHEMA.ML_TRAINED_MODELS WHERE MODEL_NAME = 'CredCardFraudModel')
        If ('isOK) {
            Write "Trying recreate the ML model...",!
            Do ..CreateMLModel()
        }
        Set attempt = attempt + 1
    } While(('isOK) && (attempt <= 5))
    Throw:('isOK) ##class(%Exception.General).%New("Couldn't create the ML model.", $$$GeneralError)
    Write "ok",!
}

}
