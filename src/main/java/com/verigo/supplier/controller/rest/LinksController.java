package com.verigo.supplier.controller.rest;

import com.verigo.SessionBean;
import com.verigo.SpringFactory;
import com.verigo.supplier.model.Link;
import com.verigo.supplier.model.Supplier;
import com.verigo.supplier.model.Stat;
import com.verigo.supplier.model.Good;
import com.verigo.supplier.model.User;
import com.verigo.supplier.service.LinkService;
import com.verigo.supplier.service.SupplierService;
import com.verigo.supplier.service.StatService;
import com.verigo.supplier.service.GoodService;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

@Path("links")
public class LinksController {

    @GET
    @Path("create")
    @Produces("text/html")
    public Response create(@QueryParam("paramSupplierName") String supplierName, @QueryParam("paramGoodName") String goodName, @QueryParam("paramPercent") int percent) {
        java.net.URI location = null;

        try {
            SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
            User currentUser = sessionBean.getCurrentUser();
            Integer currentUserId = currentUser.getId();

            Link link = new Link();
            link.setId(0);

            SupplierService customerService = (SupplierService) SpringFactory.getspringApplicationContext().getBean("supplierService");
            Supplier customer = customerService.getSupplierByName(supplierName);
            if (customer != null){
                link.setCustomerId(customer.getId());
            }

            GoodService insuranceService = (GoodService) SpringFactory.getspringApplicationContext().getBean("goodService");
            Good insurance = insuranceService.getGoodByName(goodName);
            if (insurance != null){
                link.setGoodId(insurance.getId());
            }

            link.setUserId(currentUserId);
            link.setPercent(percent);

            LinkService linkService = (LinkService) SpringFactory.getspringApplicationContext().getBean("linkService");
            linkService.createLink(link);
            
            Stat stat = new Stat();
            stat.setId(0);
            stat.setDescription("User " + currentUser.getName() + " create a new rating with id: " + link.getId());
            stat.setDate(new Date());
            
            StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
            statService.createStat(stat);

            location = new java.net.URI("../ratings-menu.jsp");

        } catch (URISyntaxException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Response.temporaryRedirect(location).build();
    }

}
