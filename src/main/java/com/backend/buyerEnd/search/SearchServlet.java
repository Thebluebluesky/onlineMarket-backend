package main.java.com.backend.buyerEnd.search;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import main.java.com.backend.buyerEnd.model.Goods;
import main.java.com.backend.defaultEnd.Dao;



public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchServlet() {
		// TODO Auto-generated constructor stub
		super();
	}
	private ArrayList<Goods> allGoods=new ArrayList<Goods>();
	private ArrayList<String> sellerName=new ArrayList<String>();
    public ArrayList<Goods> loadAllGoods(String s) {  
        //读取配置文件 
    	allGoods.clear(); sellerName.clear();
        Configuration cfg = new Configuration().configure();       
        SessionFactory factory = cfg.buildSessionFactory();  
        Session session = null;  
        try{  
            session = factory.openSession();  
            //开启事务  
            session.beginTransaction();  
           
            SQLQuery query = session.createSQLQuery("select * from [onlineMarket].[dbo].[Goods] where goodsType like '%"+s+"%' or goodsName like '%"+s+"%'");
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
        
        session = null;  
        try{  
            session = factory.openSession();  
            //开启事务  
            session.beginTransaction();  
           
            SQLQuery query;
            for (int i=0;i<allGoods.size();i++){
            	Goods goods=allGoods.get(i);
            	query=session.createSQLQuery("select userName as a "
            								+ "from [onlineMarket].[dbo].[Seller] as b,[onlineMarket].[dbo].[User] as c"
            								+ " where b.userID=c.userID and b.sellerID='"+goods.getSellerID()+"'");
            	query.addScalar("a", Hibernate.STRING);
            	String sell=(String)query.uniqueResult();
            	sellerName.add(sell);
            	
            }     
            session.getTransaction().commit();         		       		
            //提交事务              
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

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		String searchinfo=request.getParameter("searchinfo");
				
		ArrayList<Goods> allGoods=new ArrayList<>();
		allGoods=loadAllGoods(searchinfo);
		
		session.setAttribute("allGoods", allGoods);
		session.setAttribute("sellerName", sellerName);
		response.sendRedirect(request.getContextPath()+"/buy/buySearch.jsp");
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


}
