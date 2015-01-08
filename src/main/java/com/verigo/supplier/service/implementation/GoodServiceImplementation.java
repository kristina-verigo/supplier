package com.verigo.supplier.service.implementation;

import com.verigo.HibernateFactory;
import com.verigo.supplier.model.Good;
import com.verigo.supplier.service.GoodService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class GoodServiceImplementation implements GoodService {

    @Override
    public void createGood(Good good) {
        //SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(good);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public Good readGood(int goodId) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Good good;
        good = (Good) session.get(Good.class, goodId);
        session.close();

        return good;
    }

    @Override
    public void updateGood(Good good) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(good);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteGood(Good good) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.delete(good);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List getAllGoods() {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List goodsList = session.createCriteria(Good.class).list();
        session.close();

        return goodsList;
    }
    
    @Override
    public Good getGoodByName(String name) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List goodsList = session.createCriteria(Good.class).list();
        session.close();

        Good resultGood = null;
        for (int i = 0; i < goodsList.size(); i++) {
            Good good = (Good) goodsList.get(i);
            if (good.getName().equals(name)) {
                resultGood = good;
            }
        }

        return resultGood;
    }
    
}
