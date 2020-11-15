Class dc.fraudDetectionEx.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.fraudDetectionEx.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="FraudDetection" Category="" ClassName="dc.fraudDetectionEx.services.FraudDetectionService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="TransactionValidation" Category="" ClassName="dc.fraudDetectionEx.operations.TransactionValidationOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Model">CredCardFraudModel</Setting>
  </Item>
  <Item Name="TransactionValidationPersistence" Category="" ClassName="dc.fraudDetectionEx.operations.TransactionValidationPersistenceOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
    <Setting Target="Adapter" Name="FilePath">/shared/output/</Setting>
  </Item>
  <Item Name="ValidationProcess" Category="" ClassName="dc.fraudDetectionEx.processes.ValidationProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
