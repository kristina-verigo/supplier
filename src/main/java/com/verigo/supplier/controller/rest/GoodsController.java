package com.verigo.supplier.controller.rest;

import com.verigo.SessionBean;
import com.verigo.SpringFactory;
import com.verigo.supplier.model.Good;
import com.verigo.supplier.model.Stat;
import com.verigo.supplier.model.User;
import com.verigo.supplier.service.GoodService;
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

@Path("goods")
public class GoodsController {
    
    @GET
    @Path("create")
    @Produces("text/html")
    public Response create(@QueryParam("paramName") String name) {
        java.net.URI location = null;

        try {
            SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
            User currentUser = sessionBean.getCurrentUser();

            Good good = new Good();
            good.setId(0);
            good.setName(name);
            good.setDate(new Date());
            good.setUserId(currentUser.getId());

            GoodService insuranceService = (GoodService) SpringFactory.getspringApplicationContext().getBean("goodService");
            insuranceService.createGood(good);
                        
            Stat stat = new Stat();
            stat.setId(0);
            stat.setDescription("User " + currentUser.getName() + " create a new goods with id: " + good.getId());
            stat.setDate(new Date());
            
            StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
            statService.createStat(stat);

            location = new java.net.URI("../goods-menu.jsp");

        } catch (URISyntaxException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Response.temporaryRedirect(location).build();
    }
    
}
