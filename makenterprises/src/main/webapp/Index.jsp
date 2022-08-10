<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MakEnterprises</title>
</head>
<body>
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
    
</style>
</head>
<body>
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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    //this the (details block) where you can put all your constants
    const legends = true
    const day1 =[5,10,15,25,30,10,21]
    const day2 = [10,15,20,31,29,11,24]
    const day3 = [2,5,10,3,27,7,8]
    const day4 = [2,7,10,8,31,9,20]
    const labels = [
     'Monday',
     'Tuesday',
     'Wednesday',
     'Thursday',
     'Friday',
     'Saturday',
     'Sunday'
     ];
     const data = {
       labels:labels,
       datasets: [{

       label: 'chairs ',
       backgroundColor: 'green',
       borderColor: 'gray',
       data: day1,

     },{  label: 'tables ',
       backgroundColor: 'yellow',
       borderColor: 'red',
       data: day2,
    },{
        label: 'beds ',
       backgroundColor: 'blue',
       borderColor: 'cyan',
       data: day3 ,
    },{label: 'cupboards ',
       backgroundColor: 'black',
       borderColor: 'purple',
       data: day4,
    
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
    





     //Details Block for location
const legends2 = true
    const day1location =[26,30,27,31,31,28,26]
    const day2location = [10,15,20,31,29,11,24]
    const day3location = [20,24,25,15,27,16,28]
    const day4location = [2,7,10,8,31,9,20]
    const labels_location = [
     'Monday',
     'Tuesday',
     'Wednesday',
     'Thursday',
     'Friday',
     'Saturday',
     'Sunday'
     ];
     const data2location = {
       labels:labels_location,
       datasets: [{

       label: 'Kampala',
       backgroundColor: 'gray',
       borderColor: 'green',
       data: day1location,

     },{  label: 'Wakiso',
       backgroundColor: 'red',
       borderColor: 'yellow',
       data: day2location,
    },{
        label: 'Entebbe',
       backgroundColor: 'cyan',
       borderColor: 'blue',
       data: day3location ,
    },{label: 'Mukono',
       backgroundColor: 'purple',
       borderColor: 'black',
       data: day4location,
    
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
    
  








//details block for male
//this the (details block) where you can put all your constants
const legends2male = true
    const day1male =[10,6,15,25,31,8,29]
   
    const labels2male = [
     'Monday',
     'Tuesday',
     'Wednesday',
     'Thursday',
     'Friday',
     'Saturday',
     'Sunday'
     ];
     const data2male = {
       labels:labels2male,
       datasets: [{

       label: 'Daily sales',
       backgroundColor: 'red',
       borderColor: 'orange',
       data: day1male,

     
    
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
            text: ' Male  Customers and their daily Sales in MakEnterprises',
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


 //Details for female customers
 const legends2female = true
    const day1female =[20,28,16,27,31,8,6]
   
    const labels2female = [
     'Monday',
     'Tuesday',
     'Wednesday',
     'Thursday',
     'Friday',
     'Saturday',
     'Sunday'
     ];
     const data3 = {
       labels:labels2female,
       datasets: [{

       label: 'Daily sales',
       backgroundColor: 'red',
       borderColor: 'green',
       data: day1female,

     
    
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
            text: ' Female Customers and their daily sales in MakEnterprises',
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


</script>

  

</body>
</html>



        	 	
        	 		
        	 		







