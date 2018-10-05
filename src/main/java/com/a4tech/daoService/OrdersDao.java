package com.a4tech.daoService;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.connection.ConnectionProvider;
import org.hibernate.engine.SessionFactoryImplementor;
import org.hibernate.jdbc.Work;

import com.a4tech.shipping.model.Material;
import com.a4tech.shipping.model.Month;
import com.a4tech.shipping.model.Months;
import com.a4tech.shipping.model.OneDay;
import com.a4tech.shipping.model.Truck;
import com.a4tech.shipping.model.Weight;
import com.a4tech.shipping.model.Year;
import com.mysql.jdbc.Connection;

public class OrdersDao {
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public static  HashMap<String, String> monthMap = new HashMap<String, String>();
	static{
		monthMap.put("1", "January");
		monthMap.put("2", "February");
		monthMap.put("3", "March");
		monthMap.put("4", "April");
		monthMap.put("5", "May");
		monthMap.put("6", "June");
		monthMap.put("7", "July");
		monthMap.put("8", "August");
		monthMap.put("9", "September");
		monthMap.put("10", "October");
		monthMap.put("11", "November");
		monthMap.put("12", "December");
	}
	
	public  ArrayList<Month> getMonthly() throws ClassNotFoundException {

		ArrayList<Month> monthsList =new ArrayList<Month>(); 
		Session session = null;
		 java.sql.Connection connection = null ;
				try{
				/*	Transaction tx  = null;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");  */
					//tx =  session.beginTransaction();
					 session = sessionFactory.openSession();
					 session.doWork(
							 new Work() {
							 @Override
							public void execute(java.sql.Connection connection)
									throws SQLException {
								 
								 String sql = "{call shipcountDetails(?,?)}";
							        java.sql.CallableStatement callableStatement  = connection.prepareCall(sql);
							        callableStatement.registerOutParameter("monthnumber", java.sql.Types.INTEGER);  
							        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
							        //callableStatement.execute();  
							        ResultSet rs1 = callableStatement.executeQuery();
							        
							        Month monthObj=new Month();
							            while (rs1.next()) {
							            	monthObj=new Month();
							            	monthObj.setMonth(monthMap.get(rs1.getString("monthnumber") ));
							            	monthObj.setTotalOrder(rs1.getString("TotalCount"));
							            	monthsList.add(monthObj);
							              /*  System.out.println(rs1.getString("monthnumber") + " "
							                        + rs1.getString("TotalCount"));*/
							                       
							            }
							            rs1.close();
							            callableStatement.close();
							            connection.close();
								
							}
							 }
							 );
					 session.clear();
				        }finally{
				    		if(session !=null){
				    			try{
				    				session.close();
				    			}catch(Exception ex){
				    				//System.out.println(ex.getMessage());
				    			}	
				    		}
				    	}	
				return monthsList;
					
				//}catch(Exception e){ System.out.println(e);}  
				
	
	}
	




public  ArrayList<Truck> getTrucksData() throws ClassNotFoundException {
	ArrayList<Truck> trucksList  =new ArrayList<>(); 
		Session session = null;
		 //java.sql.Connection connection = null ;
				try{
				/*	Transaction tx  = null;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");  */
					//tx =  session.beginTransaction();
					 session = sessionFactory.openSession();
					 session.doWork(
							 new Work() {
							 @Override
							public void execute(java.sql.Connection connection)
									throws SQLException {
								 //String query = "SELECT Top 50 * FROM truck_info;";
								 String query = "SELECT * FROM truck_info LIMIT 50;";
							      Statement st =  connection.createStatement();
							      ResultSet rs = st.executeQuery(query);
							      
							      Truck truckbj=new Truck();
							      while (rs.next())
							      {
							    	  truckbj=new Truck();
							    	  truckbj.setSlno(rs.getString("slno"));
							    	  truckbj.setVehicleno(rs.getString("vehicleno"));
							    	  int wt=rs.getInt("vehicletype");
							    	  truckbj.setVehicletype(wt);
							    	  truckbj.setInTonne(wt);
							    	  truckbj.setInKg(Math.round(wt*1000));
							    	  truckbj.setWheels(rs.getString("wheels"));
							    	  truckbj.setEntrytype(rs.getString("entrytype"));
							    	  trucksList.add(truckbj);
							      }
							      rs.close();
							      st.close();
								/* String sql = "{call shipcountDetails(?,?)}";
							        java.sql.CallableStatement callableStatement  = connection.prepareCall(sql);
							        callableStatement.registerOutParameter("monthnumber", java.sql.Types.INTEGER);  
							        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
							        //callableStatement.execute();  
							        ResultSet rs1 = callableStatement.executeQuery();
							        
							        Truck truckbj=new Truck();
							            while (rs1.next()) {
							            	truckbj=new Truck();
							            	monthObj.setMonth(monthMap.get(rs1.getString("monthnumber") ));
							            	monthObj.setTotalOrder(rs1.getString("TotalCount"));
							            	monthsList.add(monthObj);
							                System.out.println(rs1.getString("monthnumber") + " "
							                        + rs1.getString("TotalCount"));
							                       
							            }
							            rs1.close();
							            callableStatement.close();
							            connection.close();*/
								
							}
							 }
							 );
					 session.clear();
				        }finally{
				    		if(session !=null){
				    			try{
				    				session.close();
				    			}catch(Exception ex){
				    				System.out.println(ex.getMessage());
				    			}	
				    		}
				    	}	
				return trucksList;
					
				//}catch(Exception e){ System.out.println(e);}
				}
				
	
	
	
	
	
	public Year getYearly() throws ClassNotFoundException {

		Year yrObj=new Year(); 
		Session session = null;
		try{
//		Class.forName("com.mysql.jdbc.Driver");
//		Connection con=(Connection) DriverManager.getConnection(  
//		"jdbc:mysql://localhost:3306/shipdetail","root","root");  
		        
		        
		        session = sessionFactory.openSession();
		        session.doWork(new Work() {

					@Override
					public void execute(java.sql.Connection connection)
							throws SQLException {
						   String sql = "{call ship_yearly(?)}";
					        java.sql.CallableStatement callableStatement  = connection.prepareCall(sql);
					        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
					        //callableStatement.execute();  
					        ResultSet rs1 = callableStatement.executeQuery();
					            while (rs1.next()) {
					            	yrObj.setTotalNumberOforders(rs1.getString("TotalCount"));
					            }
					            rs1.close();
					            callableStatement.close();
					            connection.close();
						
					}
		        	
		        });
		     
		        session.clear();
		        }finally{
		    		if(session !=null){
		    			try{
		    				session.close();
		    			}catch(Exception ex){
		    				
		    			}	
		    		}
		    	}	
		return yrObj;
		
		

	}
	
	public OneDay getDaily() throws ClassNotFoundException {
		// TODO Auto-generated method stub
		Session session = null;
		OneDay oneDay=new OneDay(); 
				try{
			/*	Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");  */
				
				 session = sessionFactory.openSession();
				 session.doWork(new Work() {
					
					@Override
					public void execute(java.sql.Connection connection) throws SQLException {
						 String sql = "{call OneDayData(?)}";
					        java.sql.CallableStatement callableStatement  = connection.prepareCall(sql);
					        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
					        //callableStatement.execute();  
					        ResultSet rs1 = callableStatement.executeQuery();
					            while (rs1.next()) {
					            	oneDay.setTotalCount(rs1.getString("TotalCount"));
					            }
					            rs1.close();
					            callableStatement.close();
					            connection.close();
						
					}
				});
				 session.clear();
				       
				            
				        }finally{
				    		if(session !=null){
				    			try{
				    				session.close();
				    			}catch(Exception ex){
				    				//System.out.println(ex.getMessage());
				    			}	
				    		}
				    	}	
				return oneDay;
				
				
	
	}
	
	
	public Year getTotalEpod() throws ClassNotFoundException {

		Year yrObj=new Year(); 
		Session session = null;
		try{
//		Class.forName("com.mysql.jdbc.Driver");
//		Connection con=(Connection) DriverManager.getConnection(  
//		"jdbc:mysql://localhost:3306/shipdetail","root","root");  
		        
		        
		        session = sessionFactory.openSession();
		        session.doWork(new Work() {

					@Override
					public void execute(java.sql.Connection connection)
							throws SQLException {
						   String sql = "{call epod_yearly(?)}";
					        java.sql.CallableStatement callableStatement  = connection.prepareCall(sql);
					        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
					        //callableStatement.execute();  
					        ResultSet rs1 = callableStatement.executeQuery();
					            while (rs1.next()) {
					            	yrObj.setTotalNumberOforders(rs1.getString("TotalCount"));
					            }
					            rs1.close();
					            callableStatement.close();
					            connection.close();
						
					}
		        	
		        });
		     
		        session.clear();
		        }finally{
		    		if(session !=null){
		    			try{
		    				session.close();
		    			}catch(Exception ex){
		    				
		    			}	
		    		}
		    	}	
		return yrObj;
		
		

	}
	
	public Weight getTotalWt(){


		Weight wtObj=new Weight(); 
		Session session = null;
		try{
//		Class.forName("com.mysql.jdbc.Driver");
//		Connection con=(Connection) DriverManager.getConnection(  
//		"jdbc:mysql://localhost:3306/shipdetail","root","root");  
		        
		        
		        session = sessionFactory.openSession();
		        session.doWork(new Work() {

					@Override
					public void execute(java.sql.Connection connection)
							throws SQLException {
						   String sql = "{call trucks_wt(?)}";
					        java.sql.CallableStatement callableStatement  = connection.prepareCall(sql);
					        callableStatement.registerOutParameter("total_wt", java.sql.Types.INTEGER);  
					        //callableStatement.execute();  
					        ResultSet rs1 = callableStatement.executeQuery();
					            while (rs1.next()) {
					            	wtObj.setTotalWtTonnes(Integer.toString(rs1.getInt("total_wt")));
					            }
					            rs1.close();
					            callableStatement.close();
					            connection.close();
						
					}
		        	
		        });
		     
		        session.clear();
		        }finally{
		    		if(session !=null){
		    			try{
		    				session.close();
		    			}catch(Exception ex){
		    				
		    			}	
		    		}
		    	}	
		return wtObj;
	}
	
	public  ArrayList<Material> getMatrlWt() throws ClassNotFoundException {

		ArrayList<Material> matList =new ArrayList<Material>(); 
		Session session = null;
		 java.sql.Connection connection = null ;
				try{
					/*	Transaction tx  = null;
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=(Connection) DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/shipdetail","root","root");  */
						//tx =  session.beginTransaction();
					
						 session = sessionFactory.openSession();
						 session.doWork(
								 new Work() {
								 @Override
								public void execute(java.sql.Connection connection)
										throws SQLException {
									 /*String query = "select material, sum(materialqt) as TotalMaterialTonnes from shipdetail.material group by material;";
								      Statement st =  connection.createStatement();
								      ResultSet rs = st.executeQuery(query);
								      */
									 PreparedStatement stmt=connection.prepareStatement("select material, sum(materialqt) as TotalMaterialTonnes from material group by material;");  
									 ResultSet rs=stmt.executeQuery();
								      Material matobj=new Material();
								      while (rs.next())
								      {
								    	  matobj=new Material();
								    	  matobj.setMaterialName(rs.getString(1));
								    	  matobj.setTotalTonnes(Integer.toString(rs.getInt(2)));
								    	  //int wt=rs.getInt("vehicletype");
								    	  matList.add(matobj);
								      }
								      rs.close();
								      stmt.close();
									
								}
								 }
								 );
						 session.clear();
					        }finally{
				    		if(session !=null){
				    			try{
				    				session.close();
				    			}catch(Exception ex){
				    				//System.out.println(ex.getMessage());
				    			}	
				    		}
				    	}	
				return matList;
					
				//}catch(Exception e){ System.out.println(e);}  
				
	
	}
	public  ArrayList<Material> getTraderInfo() throws ClassNotFoundException {

		ArrayList<Material> matList =new ArrayList<Material>(); 
		Session session = null;
		 java.sql.Connection connection = null ;
				try{
					/*	Transaction tx  = null;
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=(Connection) DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/shipdetail","root","root");  */
						//tx =  session.beginTransaction();
					
						 session = sessionFactory.openSession();
						 session.doWork(
								 new Work() {
								 @Override
								public void execute(java.sql.Connection connection)
										throws SQLException {
									 /*String query = "select material, sum(materialqt) as TotalMaterialTonnes from shipdetail.material group by material;";
								      Statement st =  connection.createStatement();
								      ResultSet rs = st.executeQuery(query);
								      */
									 PreparedStatement stmt=connection.prepareStatement("select entrytype,count(vehicletype) as TotalMaterialTonnes from truck_info group by entrytype order by TotalMaterialTonnes desc;");  
									 ResultSet rs=stmt.executeQuery();
								      Material matobj=new Material();
								      while (rs.next())
								      {
								    	  matobj=new Material();
								    	  matobj.setMaterialName(rs.getString(1));
								    	  matobj.setTotalTonnes(Integer.toString(rs.getInt(2)));
								    	  //int wt=rs.getInt("vehicletype");
								    	  matList.add(matobj);
								      }
								      rs.close();
								      stmt.close();
									
								}
								 }
								 );
						 session.clear();
					        }finally{
				    		if(session !=null){
				    			try{
				    				session.close();
				    			}catch(Exception ex){
				    				//System.out.println(ex.getMessage());
				    			}	
				    		}
				    	}	
				return matList;
					
				//}catch(Exception e){ System.out.println(e);}  
				
	
	}
	
	
	public  ArrayList<Material> getEpodInfo() throws ClassNotFoundException {

		ArrayList<Material> matList =new ArrayList<Material>(); 
		Session session = null;
		 java.sql.Connection connection = null ;
				try{
					/*	Transaction tx  = null;
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=(Connection) DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/shipdetail","root","root");  */
						//tx =  session.beginTransaction();
					
						 session = sessionFactory.openSession();
						 session.doWork(
								 new Work() {
								 @Override
								public void execute(java.sql.Connection connection)
										throws SQLException {
									 /*String query = "select material, sum(materialqt) as TotalMaterialTonnes from shipdetail.material group by material;";
								      Statement st =  connection.createStatement();
								      ResultSet rs = st.executeQuery(query);
								      */
									 PreparedStatement stmt=connection.prepareStatement("SELECT CAST( year(deliverdate) as char(50))as year1 ,count(*) as total FROM epodinfo group by year(deliverdate) order by year1;");  
									 ResultSet rs=stmt.executeQuery();
								      Material matobj=new Material();
								      while (rs.next())
								      {
								    	  matobj=new Material();
								    	  //java.util.Date uDate = rs.getDate("year1");
								    	  matobj.setMaterialName(rs.getString(1));
								    	  matobj.setTotalTonnes(Integer.toString(rs.getInt(2)));
								    	  //int wt=rs.getInt("vehicletype");
								    	  matList.add(matobj);
								      }
								      rs.close();
								      stmt.close();
									
								}
								 }
								 );
						 session.clear();
					        }finally{
				    		if(session !=null){
				    			try{
				    				session.close();
				    			}catch(Exception ex){
				    				//System.out.println(ex.getMessage());
				    			}	
				    		}
				    	}	
				return matList;
					
				//}catch(Exception e){ System.out.println(e);}  
				
	
	}
	
}