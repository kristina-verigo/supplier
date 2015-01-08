package com.verigo.supplier.service;

import com.verigo.supplier.model.Supplier;
import java.util.List;


public interface SupplierService {
    
    void createSupplier(Supplier supplier);
    Supplier readSupplier(int supplierId);
    void updateSupplier(Supplier supplier);
    void deleteSupplier(Supplier supplier);
    
    List getAllSuppliers();
    List getAllSuppliersByUserId(Integer userId);
    
    Supplier getSupplierByName(String name);
    
}
