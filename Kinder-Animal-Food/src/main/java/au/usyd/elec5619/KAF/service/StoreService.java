package au.usyd.elec5619.KAF.service;

import java.util.List;

import au.usyd.elec5619.KAF.model.Store;

public interface StoreService {

	List<Store> searchStoreByName(String store_name);
	
	Store searchStoreByID(Integer store_id);
	
	List<Store> storeList();
	
	boolean insertStore(Store store);
	
	boolean deleteStore(Integer store_id);
	
	boolean editStore(Store store);
	
	Integer countStore();
}
