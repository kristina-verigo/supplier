package com.verigo.supplier.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "LINK")
public class Link {
    
    private int id;
    private int customerId;
    private int goodId;
    private int userId;
    private int percent;
    
    public Link() {
        id = 0;
        customerId = 0;
        goodId = 0;
        userId = 0;
        percent = 0;
    }
    
    public Link(int customerId, int softwareId, int userId, int percent){
        id = 0;
        this.customerId = customerId;
        this.goodId = softwareId;
        this.userId = userId;
        this.percent = percent;
    }

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "SUPPLIER_ID")
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    @Column(name = "GOOD_ID")
    public int getGoodId() {
        return goodId;
    }

    public void setGoodId(int goodId) {
        this.goodId = goodId;
    }
    
    @Column(name = "USER_ID")
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Column(name = "PERCENT")
    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }
    
    
    
}