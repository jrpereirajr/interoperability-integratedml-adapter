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
  <Item Name="JavaGateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ClassPath">.:/usr/irissys/dev/java/lib/JDK18/*:/jgw/interoperability-integratedml-adapter.jar</Setting>
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/java-8-openjdk-amd64/</Setting>
    <Setting Target="Host" Name="Address">127.0.0.1</Setting>
    <Setting Target="Host" Name="HeartbeatFailureTimeout">60</Setting>
    <Setting Target="Host" Name="HeartbeatFailureAction">RA</Setting>
  </Item>
  <Item Name="ProcessTransaction" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%remoteClassname">dc.frauddetectionex.ProcessTransactionOperation</Setting>
    <Setting Target="Host" Name="%gatewayHost">127.0.0.1</Setting>
    <Setting Target="Host" Name="FailureTimeout">65</Setting>
    <Setting Target="Host" Name="%gatewayTimeout">60</Setting>
  </Item>
</Production>
}

}
