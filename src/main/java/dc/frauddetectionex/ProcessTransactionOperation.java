package dc.frauddetectionex;

import java.io.FileWriter;

import com.intersystems.enslib.pex.BusinessOperation;
import com.intersystems.gateway.GatewayContext;
import com.intersystems.jdbc.IRIS;
import com.intersystems.jdbc.IRISObject;

public class ProcessTransactionOperation extends BusinessOperation {

    private IRIS iris;

    @Override
    public void OnInit() throws Exception {
        iris = GatewayContext.getIRIS();
    }
    
    @Override
    public Object OnMessage(Object request) throws Exception {
        IRISObject req = (IRISObject) request;
        String filePath = "/shared/output/transactions-processed.txt";//
        processTransaction(filePath, req);
        IRISObject response = (IRISObject)(iris.classMethodObject("Ens.StringContainer", "%New", ""));
        return response;
    }
    
    public void processTransaction(String filePath, IRISObject req) {
        try {
            FileWriter myWriter = new FileWriter(filePath, true);
            myWriter.write(req.getString("SerializedTransaction")+"\n");
            myWriter.close();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    @Override
    public void OnTearDown() throws Exception { }

}
