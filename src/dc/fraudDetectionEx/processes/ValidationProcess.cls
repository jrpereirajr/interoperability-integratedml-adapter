/// 
Class dc.fraudDetectionEx.processes.ValidationProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='dc.fraudDetectionEx.model.TransactionRequest' response='dc.fraudDetectionEx.model.TransactionResponse' height='2000' width='2000' >
<sequence xend='200' yend='800' >
<call name='TransactionFraudValidation' target='TransactionValidation' async='0' xpos='200' ypos='250' >
<annotation><![CDATA[Uses the ML Adapter to validate a transaction through
a classification mc&l for credit card fraud detection]]></annotation>
<request type='dc.fraudDetectionEx.model.TransactionRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='dc.fraudDetectionEx.model.TransactionResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<call name='FilePersistence' target='TransactionValidationPersistence' async='0' xpos='200' ypos='350' >
<annotation><![CDATA[Persists the classification result for futher analysis]]></annotation>
<request type='dc.fraudDetectionEx.model.TransactionRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='dc.fraudDetectionEx.model.TransactionResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<if name='Is fraud?' condition='response.IsFraud = 1' xpos='200' ypos='450' xend='200' yend='700' >
<annotation><![CDATA[Check if the response has the isFraud flag enabled]]></annotation>
<true>
<alert value='"Suspicious transaction detected!"' xpos='470' ypos='600' >
<annotation><![CDATA[Issues an alert for suspicious transaction]]></annotation>
</alert>
</true>
<false>
<call name='ProcessTransaction (Java)' target='ProcessTransaction' async='1' xpos='200' ypos='600' >
<request type='dc.fraudDetectionEx.model.TransactionRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='Ens.Response' />
</call>
</false>
</if>
</sequence>
</process>
}

}
