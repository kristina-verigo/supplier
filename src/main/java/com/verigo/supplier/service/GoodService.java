package com.verigo.supplier.service;

import com.verigo.supplier.model.Good;
import java.util.List;

public interface GoodService {
    
    void createGood(Good good);

    Good readGood(int goodId);

    void updateGood(Good good);

    void deleteGood(Good good);

    List getAllGoods();
    
    Good getGoodByName(String name);
}
