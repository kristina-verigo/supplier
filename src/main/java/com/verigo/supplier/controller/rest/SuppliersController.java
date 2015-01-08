package com.verigo.supplier.controller.rest;

import com.verigo.SessionBean;
import com.verigo.SpringFactory;
import com.verigo.supplier.model.Supplier;
import com.verigo.supplier.model.Stat;
import com.verigo.supplier.model.User;
import com.verigo.supplier.service.SupplierService;
import com.verigo.supplier.service.StatService;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

@Path("suppliers")
public class SuppliersController {

    @GET
    @Path("create")
    @Produces("text/html")
    public Response create(@QueryParam("paramName") String name) {
        java.net.URI location = null;

        try {
            SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
            User currentUser = sessionBean.getCurrentUser();

            Supplier supplier = new Supplier();
            supplier.setId(0);
            supplier.setName(name);
            supplier.setDate(new Date());
            supplier.setUserId(currentUser.getId());

            SupplierService supplierService = (SupplierService) SpringFactory.getspringApplicationContext().getBean("supplierService");
            supplierService.createSupplier(supplier);            
                        
            Stat stat = new Stat();
            stat.setId(0);
            stat.setDescription("User " + currentUser.getName() + " create a new supplier with id: " + supplier.getId());
            stat.setDate(new Date());
            
            StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
            statService.createStat(stat);

            location = new java.net.URI("../suppliers-menu.jsp");

        } catch (URISyntaxException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Response.temporaryRedirect(location).build();
    }

}
