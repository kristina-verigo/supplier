package com.verigo.supplier.service.implementation;

import com.verigo.HibernateFactory;
import com.verigo.supplier.model.Supplier;
import com.verigo.supplier.service.SupplierService;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class SupplierServiceImplementation implements SupplierService{

    @Override
    public void createSupplier(Supplier supplier) {
    //SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(supplier);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public Supplier readSupplier(int supplierId) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Supplier supplier;
        supplier = (Supplier) session.get(Supplier.class, supplierId);
        session.close();

        return supplier;
    }

    @Override
    public void updateSupplier(Supplier supplier) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(supplier);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteSupplier(Supplier supplier) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.delete(supplier);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List getAllSuppliers() {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List suppliersList = session.createCriteria(Supplier.class).list();
        session.close();

        return suppliersList;
    }
    
    @Override
    public List getAllSuppliersByUserId(Integer userId){
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List suppliersList = session.createCriteria(Supplier.class).list();
        session.close();
        
        List userSuppliersList = new ArrayList();
        for (int i = 0; i < suppliersList.size(); i++){
            Supplier supplier = (Supplier) suppliersList.get(i);
            if (supplier != null){
                if (supplier.getUserId() == userId){
                    userSuppliersList.add(supplier);
                }    
            }
            
        }

        return userSuppliersList;
    }
    
    @Override
    public Supplier getSupplierByName(String name) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List suppliersList = session.createCriteria(Supplier.class).list();
        session.close();
        
        Supplier resultSupplier = null;
        for (int i = 0; i < suppliersList.size(); i++){
            Supplier supplier = (Supplier) suppliersList.get(i);
            if (supplier.getName().equals(name)){
                resultSupplier = supplier;
            }
        }

        return resultSupplier;
    }
    
}
