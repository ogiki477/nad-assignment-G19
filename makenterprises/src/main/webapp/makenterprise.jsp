<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>


<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.format.TextStyle"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.time.DayOfWeek"%>




<%@page import="java.sql.*,java.util.*" %>
<%!Integer y[]={};%>
<%!String x[]={};%>
<%ArrayList<Integer> ylabel=new ArrayList<Integer>(Arrays.asList(y));%>
<%ArrayList<String> xlabel=new ArrayList<String>(Arrays.asList(x));%>
<%!ResultSet sql;%>

<%!Integer oney[]={};%>
<%!String  onex[]={};%>
<%ArrayList<Integer> oneylabel=new ArrayList<Integer>(Arrays.asList(oney));%>
<%ArrayList<String> onexlabel=new ArrayList<String>(Arrays.asList(onex));%>
<%!ResultSet omo;%>


<%!Integer prefer1[]={};%>
<%!String  prefer2[]={};%>
<%ArrayList<Integer> prefer1label=new ArrayList<Integer>(Arrays.asList(prefer1));%>
<%ArrayList<String> prefer2label=new ArrayList<String>(Arrays.asList(prefer2));%>
<%!ResultSet preference;%>



<%!Integer location1[]={};%>
<%!String  location2[]={};%>
<%ArrayList<Integer> location1label=new ArrayList<Integer>(Arrays.asList(location1));%>
<%ArrayList<String> location2label=new ArrayList<String>(Arrays.asList(location2));%>
<%!ResultSet location;%>


<%!ResultSet customersmale;%>






<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mak_enterprises";
String userId = "root";
String password  = "";


try{
	Class.forName(driverName);
	
}catch(ClassNotFoundException e){
	e.printStackTrace();
}
// Connection connection = null;
 //Statement statement = null;
// ResultSet resultSet = null;
 %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Mak Enterprises</title>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type = "text/css">

        *{
            margin:0;
            padding:0;
            font-family: sans-serif;
        }
        .chartMenu{
           width:100vw;
           height:40px;
           background:fixed;
           color:blue;

        }
        .chartMenu{
            padding:10px;
            font-size: 20px;

        }
        .chartCard{

            width: 95vw;
            height: calc(100vh- 40px);
            background: whitesmoke;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .chartbox{

          width: 700px;
          padding:20px;
          border-radius: 20px;
          border: solid 3px gray;
          background:lightgoldenrodyellow;
        }
        .omo{

            align-items: center;
            justify-content: center;
            padding-right: 40px; 
        }
        .moses{
        
         color:blue;
        
        }
        
    </style>
</head>
<body>
	 <%
	 
	 
	      
        	 try{
        	 	Connection conn = DriverManager.getConnection(connectionUrl+dbName, userId,password);
        	 	Statement st = conn.createStatement();
        	 	//male line chart
        	 	
        	 	
        	 	
        	 	
        	 	sql= st.executeQuery("SELECT totalPurchase,UpdationDate FROM customers where gender='male'");
        	 	//String omomoses = sql.getString(" UpdationDate ");
        	 	while(sql.next()){

                  
        	 		
        	 		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        	 		//LocalDate date = LocalDate.parse(" omomoses ",formatter);
        	 		//DayOfWeek dow = date.getDayOfWeek();
        	 		//String output = dow.getDisplayName(TextStyle.SHORT,Locale.US);
        	 		
        	 		
        	 		
        	 		xlabel.add("'"+ sql.getString("UpdationDate") +"'");
        	 		ylabel.add(sql.getInt("totalPurchase"));
        	 	}
        	
        	 		//female line chart
        		
        	 	omo = st.executeQuery("SELECT totalPurchase, UpdationDate  FROM customers where gender = 'female'");
        	 	while(omo.next()){
        	 		onexlabel.add("'"+omo.getString("UpdationDate")+"'");
        	 		oneylabel.add(omo.getInt("totalPurchase"));
        	 	}
        	 	
        
              
        		preference = st.executeQuery("SELECT * FROM products");
        		while(preference.next()){
        			prefer2label.add("'"+preference.getString("productName")+"'");
        			prefer1label.add(preference.getInt("productPrice"));
        		}

        		location = st.executeQuery("SELECT * FROM customers");
        		while(location.next()){
        			location2label.add("'"+location.getString("shippingState")+"'");
        			location1label.add(location.getInt("shippingAmount"));
        		}
	
        	 
        	 } catch(Exception e){
        	 	e.printStackTrace();
        	 }

      %>
        	
 <div class="chartMenu">MAK ENTERPRISES REPORT</div>
    <h4>Bar graphs showing  how customers' preferences and their locations  affect sales in MakEnterprises</h4>
    <div class="chartCard">
        <div class="chartbox">
            <canvas id="makChart"></canvas>
        </div>
        
        <div class="chartbox">
            <canvas id="makChart2"></canvas>
        </div>
    </div>

   <div><h4 class="omo">line graphs showing sales details for  male and female customers in MakEnterprises</h4></div>
    <div class="chartCard">
        <div class="chartbox">
            <canvas id="makChart2male"></canvas>
        </div>
        
        <div class="chartbox">
            <canvas id="makChart2female"></canvas>
        </div>
    </div>
    
    
    
        <div class="container">
        <div class="row">
        <div class="col-sm-4 col-sm-offset">
            <h1 class="moses">summary of the customers</h1>
            
              <table class="table table-striped table-hover">
                <tr>
                    <td><h4 class="text-danger"><label >All the customers who have purchased from mak_enterprises</label></h4>
                   </td>
                   <td><h4 class="text-danger" ><label >The gender  of the customers who purchased from mak_enterprises</label></h4>
                    </td>
                   <td><h4 class="text-danger" ><label >locations of the customers who purchased from mak_enterprises</label></h4>
                    </td>
                     <td><h4 class="text-danger" ><label >Purchases of the customers who purchased from mak_enterprises</label></h4>
                    
                    
                </tr>
              
                <%     
                try{
            	 	Connection conn = DriverManager.getConnection(connectionUrl+dbName, userId,password);
            	 	Statement st = conn.createStatement();
            	 	
            	 
            	 		
            	 		
            	 		
            	 	customersmale = st.executeQuery("SELECT * FROM customers ");
            	 	while(customersmale.next()){
            	 		
            	 
            	 		
                	 		
            	 	
            	 	%>
          
               <tr>
               
               <td><%=customersmale.getString("name") %></td>
               <td><%=customersmale.getString("gender") %></td>
                 <td><%=customersmale.getString("location") %></td>
                  <td><%=customersmale.getString("totalPurchase") %></td>
                  
                  
              
               
               </tr>
               
               <%
                	 	}
                	 	
                	 	 }catch (Exception e){
                
                	e.printStackTrace();
                }
               
                
               %>
               
        		
              </table>
              
        

        </div>

    </div>

</div>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    
    <script>
    //details block for male
    //this the (details block) where you can put all your constants
    const legends2male = true
          
       
        
          const data2male = {
            labels:<%out.println(xlabel);%>,
            datasets: [{

            label: 'total purchase',
            backgroundColor: 'red',
            borderColor: 'orange',
            data: <%out.println(ylabel);%>,

          
         
         }]
         };

         //config for male
         const config2male = {
         type: 'line',
         data: data2male,
         options:{
             
             plugins:{
                legend:{
                     display: legends2male,
                     position: 'right',
                 },  
              
                 title:{

                 display:true,
                 text: ' Male  Customers and their purchases on specific dates and time in MakEnterprises',
                 fontSize: 100
              
              
              },
              layout:{
                 padding:{
                     left:60,
                     right: 0,
                     bottom: 0,
                     top:0
                 }
             }
          
             },
             tooltips:{
             enabled: false
             },

            
         }
         };
       //Render Block 2 for male
       var makChart2male = new Chart(
             document.getElementById('makChart2male'),
             config2male
         );
       
       
       
       
       
       
    
    //DEtails block for females 
      const legends2female = true
        
       
        
         const data3 = {
           labels:<%out.println(onexlabel);%>,
           datasets: [{

           label: 'total purchase',
           backgroundColor: 'red',
           borderColor: 'green',
           data: <%out.println(oneylabel);%>,

         
        
        }]
        };

      //config for female
      const config2female = {
        type: 'line',
        data: data3,
        options:{
            
            plugins:{
               legend:{
                    display: legends2female,
                    position: 'right',
                },  
             
                title:{

                display:true,
                text: ' Female Customers and their purchases on specific dates and time in MakEnterprises',
                fontSize: 100
             
             
             },
             layout:{
                padding:{
                    left:60,
                    right: 0,
                    bottom: 0,
                    top:0
                }
            }
         
            },
            tooltips:{
            enabled: false
            },

           
        }
        };

        //Render Block for female
        var makChart2female = new Chart(
            document.getElementById('makChart2female'),
            config2female
        ); 
    
    
    //details block for the products/prferences 
           const legends = true
       
       
    
        
         const data = {
           labels:<%out.println(prefer2label);%>,
           datasets: [{

           label: 'Amount Bought',
           backgroundColor: 'maroon',
           borderColor: 'gray',
           data: <%out.println(prefer1label);%>,

         
        }]
        };
        //config block
        const config = {
        type: 'bar',
        data,
        options:{
        	   
            
            plugins:{
               legend:{
                    display: legends,
                    position: 'right',
                },  
             
                title:{

                display:true,
                text: ' Customers and their preferences in MakEnterprises',
                fontSize: 100
             
             
             },
             layout:{
                padding:{
                    left:60,
                    right: 0,
                    bottom: 0,
                    top:0
                }
            },
            scales:{
    	        y:{
    	            title:{
    	                display:true,
    	                text:"ylabel"
    	            }
    	        },
    	        x:{
    	            title:{
    	                display:true,
    	                text:"yooooo"
    	            }
    	        }
    	        }
         
            },
            tooltips:{
            enabled: false
            },

           
        }
        };

       //Render Block
        var makChart = new Chart(
            document.getElementById('makChart'),
            config
        );
        
    
    
    //the details block for locations
      const legends2 = true
       
       
        
         const data2location = {
           labels: <%out.println(location2label);%>,
           datasets: [{

           label: 'Sales rate',
           backgroundColor: 'maroon',
           borderColor: 'green',
           data:<%out.println(location1label);%> ,

         
        
        }]
        };

         //Config Block for locations
         const config2 = {
        type: 'bar',
        data: data2location,
        options:{
            
            plugins:{
               legend:{
                    display: legends2,
                    position: 'right',
                },  
             
                title:{

                display:true,
                text: 'Locations  and their rate of sales in MakEnterprises',
                fontSize: 100
             
             
             },
             layout:{
                padding:{
                    left:60,
                    right: 0,
                    bottom: 0,
                    top:0
                }
            }
         
            },
            tooltips:{
            enabled: false
            },

           
        }
        }; 

        //Render block for Chart2 for locations!!
        var makChart2 = new Chart(
            document.getElementById('makChart2'),
            config2
        );
        
    
    
   </script>
      <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>