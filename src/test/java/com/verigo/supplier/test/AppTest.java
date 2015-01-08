package com.verigo.supplier.test;

import com.verigo.SpringFactory;
import com.verigo.supplier.model.Supplier;
import com.verigo.supplier.model.Link;
import com.verigo.supplier.model.Good;
import com.verigo.supplier.model.Stat;
import com.verigo.supplier.model.User;
import com.verigo.supplier.service.SupplierService;
import com.verigo.supplier.service.LinkService;
import com.verigo.supplier.service.GoodService;
import com.verigo.supplier.service.StatService;
import com.verigo.supplier.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static org.junit.Assert.fail;

import org.junit.Test;

public class AppTest {

    @Test
    public void testUsers() {
        System.out.println("Working Directory = "
                + System.getProperty("user.dir"));

        // User service test!
        System.out.println("User service test.");

        UserService userService = (UserService) SpringFactory.getspringApplicationContext().getBean("userService");

        User user = new User();
        user.setId(0);
        user.setLogin("hibernateUser");
        String userName = "Hibernate test user";
        user.setName(userName);
        user.setPassword("hibernate");
        user.setRegistrationDate(new Date());

        userService.createUser(user);
        int userId = user.getId();
        System.out.println("create user done. User id: " + userId);

        user = userService.readUser(userId);
        if (!user.getName().equals(userName)) {
            fail("User name from create and read operations are not equals!!!");
        } else {
            System.out.println("Read user done!");
        }

        userName = "new Name";
        user.setName(userName);
        userService.updateUser(user);
        userId = user.getId();
        user = userService.readUser(userId);
        if (!user.getName().equals(userName)) {
            fail("User name from update and read operations are not equals!!!");
        } else {
            System.out.println("Update user done!");
        }

        String userLogin = user.getLogin();
        User tempUser = userService.getUserByLogin(userLogin);
        System.out.println("Test userService.getUserByLogin: " + tempUser.getName());

        userService.deleteUser(user);
        System.out.println("Delete user done!");

        // Supplier service test. -----------------------------------------------       
        System.out.println("Customer service test.");
        SupplierService supplierService = (SupplierService) SpringFactory.getspringApplicationContext().getBean("supplierService");
        Supplier supplier = new Supplier();
        supplier.setId(0);
        supplier.setName("Supplier test");
        supplier.setDate(new Date());

        supplierService.createSupplier(supplier);
        System.out.println("create supplier done. Supplier id: " + supplier.getId());

        supplierService.deleteSupplier(supplier);
        System.out.println("Delete supplier done!");
        
        
        
        // Good service test. -----------------------------------------------       
        System.out.println("Goods service test.");
        GoodService goodService = (GoodService) SpringFactory.getspringApplicationContext().getBean("goodService");
        Good good = new Good();
        good.setId(0);
        good.setName("Good test");
        good.setDate(new Date());
        good.setUserId(1);

        goodService.createGood(good);
        System.out.println("create good done. Good id: " + supplier.getId());

        goodService.deleteGood(good);
        System.out.println("Delete good done!");

        // Stat service test. --------------------------------------------------      
        System.out.println("Stat service test.");
        StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
        Stat stat = new Stat();
        stat.setId(0);
        stat.setDate(new Date());
        stat.setDescription("First stat record!");

        statService.createStat(stat);
        System.out.println("Create stat done. Stat id: " + stat.getId());

        statService.deleteStat(stat);
        System.out.println("Delete stat done!");
        
        // Link service test. --------------------------------------------------
        
        LinkService linkService = (LinkService) SpringFactory.getspringApplicationContext().getBean("linkService");
        //linkService.createLink(link);
        
        
        List linksList = new ArrayList();
                linksList = linkService.getAllLinksByCustomerId(1);
                linksList  =null;
        
    }
}
