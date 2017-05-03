package main.java.com.backend.buyerEnd.search;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import main.java.com.backend.buyerEnd.model.Goods;
import main.java.com.backend.defaultEnd.Dao;

public class SearchBean {
	public SearchBean(){
		super();
	}
	
	private ArrayList<Goods> allGoods=new ArrayList<Goods>();
	private ArrayList<String> allType=new ArrayList<String>();
	
	public ArrayList<String> getAllType() { 
    	
    	allType.clear();
        Configuration cfg = new Configuration().configure();       
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try{  
            session = factory.openSession();  
            //开启事务  
            session.beginTransaction();  
           
            SQLQuery query = session.createSQLQuery("select distinct goodsType as a from [onlineMarket].[dbo].[Goods]");
            
            query.addScalar("a", Hibernate.STRING);
            
        	for(Object item:query.list()){
            	String type=(String)item;
            	allType.add(type);	
            }
        	
            //提交事务  
            session.getTransaction().commit();  
            
        }catch(Exception e){  
            e.printStackTrace();  
            //回滚事务  
            session.getTransaction().rollback();  
        }finally{  
            if(session != null){  
                if(session.isOpen()){  
                    //关闭session  
                    session.close();  
                }  
            }  
        }  
        return allType;
    }  


    //public ArrayList<Goods> loadAllGoods(String s) { 
	public ArrayList<Goods> loadAllGoods() { 
    	
    	allGoods.clear();
        Configuration cfg = new Configuration().configure();       
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try{  
            session = factory.openSession();  
            //开启事务  
            session.beginTransaction();  
           
            SQLQuery query = session.createSQLQuery("select * from [onlineMarket].[dbo].[Goods]");
            query.addEntity(Goods.class);           
            		       		
            for(Object item:query.list()){
            	Goods goods=(Goods)item;
            	allGoods.add(goods);	
            }

            //提交事务  
            session.getTransaction().commit();  
            
        }catch(Exception e){  
            e.printStackTrace();  
            //回滚事务  
            session.getTransaction().rollback();  
        }finally{  
            if(session != null){  
                if(session.isOpen()){  
                    //关闭session  
                    session.close();  
                }  
            }  
        }  
        return allGoods;
    }  
    
    public int getSize(){
    	return allGoods.size();
    }
    
    public String getGoodsName(int index){
    	Goods good=allGoods.get(index);
    	return good.getGoodsName();
    }
    
    public String getPicture(int index){
    	Goods good=allGoods.get(index);
    	return good.getSourceArea();
    }    
}
