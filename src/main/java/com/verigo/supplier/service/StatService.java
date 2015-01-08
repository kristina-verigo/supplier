package com.verigo.supplier.service;

import com.verigo.supplier.model.Stat;
import java.util.List;

public interface StatService {
    
    void createStat(Stat stat);

    Stat readTask(int statId);

    void updateStat(Stat stat);

    void deleteStat(Stat stat);

    List getAllStats();
    
}
