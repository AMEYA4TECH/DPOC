package com.a4tech.mapper;
import java.io.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.a4tech.dao.entity.ShippingEntity;
import com.a4tech.daoService.ShippingDao;
import com.a4tech.shipping.model.Months;
import com.a4tech.shipping.model.OneDay;
import com.a4tech.shipping.model.Year;
import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;

public class ShippingMapping {
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
	public static void main(String args[]) throws ClassNotFoundException{
		/*ArrayList<Months> monthsList=getMonthlyShippingData();
		for (Months months : monthsList) {
			System.out.println(months.getMonth()+"|"+months.getTotalOrder() );
			//System.out.println();
			}*/
		//Year yrobj=getYearShippingData();
		OneDay yrobj=getOneDayShippingData();
		System.out.println(yrobj.getTotalCount());
	}  
	ShippingDao shippingDao;
	
	public static  ArrayList<Months> getMonthlyShippingData() throws ClassNotFoundException{
		ArrayList<Months> monthsList =new ArrayList<Months>(); 
				try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");  
				        String sql = "{call shipcountDetails(?,?)}";
				        java.sql.CallableStatement callableStatement  = con.prepareCall(sql);
				        callableStatement.registerOutParameter("monthnumber", java.sql.Types.INTEGER);  
				        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
				        //callableStatement.execute();  
				        ResultSet rs1 = callableStatement.executeQuery();
				        
				        Months monthObj=new Months();
				            while (rs1.next()) {
				            	monthObj=new Months();
				            	monthObj.setMonth(monthMap.get(rs1.getString("monthnumber") ));
				            	monthObj.setTotalOrder(rs1.getString("TotalCount"));
				            	monthsList.add(monthObj);
				              /*  System.out.println(rs1.getString("monthnumber") + " "
				                        + rs1.getString("TotalCount"));*/
				                       
				            }
				            rs1.close();
				            callableStatement.close();
				            con.close();
				            
				        } catch (SQLException ex) {
				            System.out.println(ex.getMessage());
				        }
				return monthsList;
					
				//}catch(Exception e){ System.out.println(e);}  
				
	}
	
	
	public static Year getYearShippingData() throws ClassNotFoundException{
		Year yrObj=new Year(); 
				try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");  
				        String sql = "{call ship_yearly(?)}";
				        java.sql.CallableStatement callableStatement  = con.prepareCall(sql);
				        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
				        //callableStatement.execute();  
				        ResultSet rs1 = callableStatement.executeQuery();
				            while (rs1.next()) {
				            	yrObj.setTotalNumberOforders(rs1.getString("TotalCount"));
				            }
				            rs1.close();
				            callableStatement.close();
				            con.close();
				            
				        } catch (SQLException ex) {
				            System.out.println(ex.getMessage());
				        }
				return yrObj;
				
				
	}
	
	public static OneDay getOneDayShippingData() throws ClassNotFoundException{
		OneDay oneDay=new OneDay(); 
				try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");  
				        String sql = "{call OneDayData(?)}";
				        java.sql.CallableStatement callableStatement  = con.prepareCall(sql);
				        callableStatement.registerOutParameter("TotalCount", java.sql.Types.INTEGER);  
				        //callableStatement.execute();  
				        ResultSet rs1 = callableStatement.executeQuery();
				            while (rs1.next()) {
				            	oneDay.setTotalCount(rs1.getString("TotalCount"));
				            }
				            rs1.close();
				            callableStatement.close();
				            con.close();
				            
				        } catch (SQLException ex) {
				            System.out.println(ex.getMessage());
				        }
				return oneDay;
				
				
	}
	public static void inservalue(int id,String date){
		  
		//String strArr[]=date.split("/");
//		String finalDate="";
//		//yyyy-mm-dd
//		if(strArr.length==3){
//			String strMonth=strArr[0];
//			if(strMonth.length()==1){
//				strMonth="0"+strMonth;
//			}
//			finalDate=strArr[2]+"-"+strMonth+"-"+strArr[1];
//		}
		
				try{  
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=(Connection) DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/shipdetail","root","root");   
				/*Statement stmt=(Statement) con.createStatement();  
				ResultSet rs=stmt.executeQuery("select * from shipinfo");  
				while(rs.next())  
				System.out.println(rs.getInt(1)+"  "+rs.getString(2));  
				con.close();  
				*/
				 Statement st = (Statement) con.createStatement();
				 String str="INSERT INTO shipinfo (id, deliverdate) ";
				 //int id=1;
				 //String date="'2018-07-24'";
				String str2="VALUES ("+Integer.toString(id)+",'"+date+"')";
			      // note that i'm leaving "date_created" out of this insert statement
//			      st.executeUpdate("INSERT INTO shipinfo (id, deliverdate) "
//			          +"VALUES (1, '2018-07-22')");
				str2=str+str2;
				System.out.println(str2);
				
				st.executeUpdate(str2);

			      con.close();
				}catch(Exception e){ System.out.println(e);}  
				
	}
	public static void mapper()
	{
		ShippingEntity entityObj=new ShippingEntity();
		try{
			@SuppressWarnings("resource")
			XSSFWorkbook workbook=new XSSFWorkbook(new  FileInputStream("D://Dalmia//dbfile//orders.XLSX"));
			XSSFSheet sheet=workbook.getSheetAt(0);
			Iterator<Row> iterator = sheet.iterator();
			int id=0;
			while (iterator.hasNext()) {
				Row nextRow = iterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				if (nextRow.getRowNum() == 0)
					continue;
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					int columnIndex = cell.getColumnIndex();
					switch (columnIndex + 1) {
					case 1:// id
						/*String id=cell.getStringCellValue();
						int result = Integer.parseInt(id);		
					    System.out.println("id----"  +id);
					    entityObj.setId(result);*/
					    id++;
						break;
		            case 14://Deliv. date(From/to)
						String date="";//=cell.getStringCellValue();
						//String value = "";
						try {
							if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
								date = cell.getStringCellValue().trim();
							} else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
								//int numericValue = (int) cell.getNumericCellValue();
								
								 if (DateUtil.isCellDateFormatted(cell)) {
				                        System.out.println(cell.getDateCellValue());
				                        java.util.Date dateobj=cell.getDateCellValue();
				                        date= new SimpleDateFormat("yyyy-MM-dd").format(dateobj);
				                        
				                    } else {
				                        System.out.println(cell.getNumericCellValue());
				                    }
								//date = String.valueOf(numericValue).trim();
							}else if(cell.getCellType() == Cell.CELL_TYPE_ERROR){
								//value = String.valueOf(cell.getErrorCellValue());
								date = Byte.toString(cell.getErrorCellValue()).trim();
								date="";
							}else if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){
								//value = String.valueOf(cell.getErrorCellValue());
								boolean val = cell.getBooleanCellValue();
								date=String.valueOf(val);
							}else if(cell.getCellType() == Cell.CELL_TYPE_STRING){
								
							}
							
						} catch (Exception e) {
							/*_LOGGER.error("Cell value convert into String/Int format: "
									+ e.getMessage());*/
						}

						
						inservalue(id, date);
						break;	
						
						
		     
					
					}
				}
			
			}
			
			
		}catch(Exception e)
		{
		System.out.println(e.getMessage());	
		}
		
		
		//shippingDao.saveShippingEntity(entityObj);
	}



	public ShippingDao getShippingDao() {
		return shippingDao;
	}

	public void setShippingDao(ShippingDao shippingDao) {
		this.shippingDao = shippingDao;
	}
	
	
	
	
	
	
}
