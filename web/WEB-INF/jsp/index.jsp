<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Monda:400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/homeStyle.css" />
	<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      <script>
         $(function() {
            $( "#datepicker1" ).datepicker();
           
         });
		 $(function() {
            $( "#datepicker2" ).datepicker();
           
         });
      </script>

</head>

<body>
 <nav class="navbar navbar-default navbar-fixed-top opaque-navbar">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand navbar-link" href="#"> </a>
                <button class="navbar-toggle collapsed toggle-animated" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li role="presentation"><a href="#intro">Home. </a></li>
                    <li role="presentation"><a href="#">Case Studies.</a></li>
                    <li role="presentation"><a href="#">Works. </a></li>
                    <li role="presentation"><a href="#">About. </a></li>
                    <li role="presentation"><a href="#">Contact. </a></li>
                </ul>
            </div>
        </div>
    </nav>
	
	
    <div class="carousel slide" data-ride="carousel" id="carousel-1">
        <div class="carousel-inner" role="listbox">
            <div class="item active"><img src="assets/img/1.jpg" alt="Slide Image"></div>
            <div class="item"><img src="assets/img/2.jpg" alt="Slide Image"></div>
            <div class="item"><img src="assets/img/3.jpg" alt="Slide Image"></div>
			<div class="item"><img src="assets/img/4.jpg" alt="Slide Image"></div>
        </div>
        <div><a class="left carousel-control" href="#carousel-1" role="button" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i><span class="sr-only">Previous</span></a>
            <a class="right carousel-control" href="#carousel-1" role="button" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i><span class="sr-only">Next</span></a>
        </div>
        <ol class="carousel-indicators">
            <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-1" data-slide-to="1"></li>
            <li data-target="#carousel-1" data-slide-to="2"></li>
			<li data-target="#carousel-1" data-slide-to="2"></li>
        </ol>
    </div>
	<!-----------------------------------------check form-------------------------------->
	<div class="container-fluid well" style="padding-bottom: 100px;">
	 <div class="container" >
	<div class="checkForm" style="text-align: center">
	  <div class="row">
	    <form action="" method="post">
		   <div class="col-3 col-md-3">
		   <div class="input-group date mg-check-in">
							<div class="input-group date mg-check-in">
                   
			<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
			<input type="text" class="form-control" id="datepicker1" placeholder="Check-In Date">
			</div>
										</div>

		   </div>
		   <div class="col-3 col-md-3">
		    <div class="input-group date mg-check-in">
			<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
			<input type="text" class="form-control" id="datepicker2" placeholder="Check-Out Date">
			</div>
		   
		   </div>
		   <div class="col-3 col-md-3">
		   <select class="select_room" data-style="btn-primary" onchange="roomType(this.value)" >
      <option value="1">Single-Bed Room</option>
      <option value="2">Double-Bed Room</option>
      <option value="3">Triple-Bed Room</option>
  </select>
		   </div>
		   <div class="col-3 col-md-3">
		    <div class="row">
			<div id="Sadults">
			
			</div>
			</div>
			<div class="row">
			<div id="Skids">
			
			</div>
			</div>
		   </div>
		   <div class="row">
		 <button type="submit" class="btn btn-primary">Check Availability</button>
		   </div>
		   <div class="row">
		   <div id="result">
		   RESULT
		   </div>
		   </div>

		</form>
 	  </div>
	  </div>
	</div>
		
	</div>
	<!--------------------------------------------------------------------------------------->
    <div class="jumbotron-triangular-addon-wrapper" style=" background: white">
        <div class="jumbotron-addon jumbotron-addon-top jumbotron-addon-triangular" >
            <div class="bg-primary addon-triangular-inner addon-triangular-inner-top"><i class="glyphicon glyphicon-star"></i></div>
        </div>
        <div class="jumbotron">
            <h1>Jumbotron Triangular Addon</h1>
            <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
            <p><a class="btn btn-default" role="button" href="#">Learn more</a></p>
        </div>
        <div class="jumbotron-addon jumbotron-addon-bottom jumbotron-addon-triangular">
            <div class="bg-primary addon-triangular-inner addon-triangular-inner-bottom"><span>@ </span></div>
        </div>
    </div>
    <div class="footer-clean">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-4 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Web design</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Hosting</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-4 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Legacy</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-4 item">
                        <h3>Careers</h3>
                        <ul>
                            <li><a href="#">Job openings</a></li>
                            <li><a href="#">Employee success</a></li>
                            <li><a href="#">Benefits</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a>
                        <p class="copyright">Company Name © 2016</p>
                    </div>
                </div>
            </div>
        </footer>
		
    </div>
   
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.min.js"></script>
	<script>
	$(document).ready(function(){
	//alert($(".select_room").val());
	room($(".select_room").val());
	});
	
	
	function room(val){
	var i = Number(val) ;
	var arr = [];
	var adults = "<select class='select_adults' data-style='btn-primary' >";
	var kids = "<select class='select_adults' data-style='btn-primary' >";
	
	for(var j = 0; j < i; j++){
	   arr.push(j);
	}
	//alert(arr);
	for(var j = arr.length; j > -1; j--){
	  adults += "<option value='"+j+"'>"+ j + "</option> ";
	  
	  if(j < 3){
	  kids += "<option value='"+j+"'>"+ j + "</option> ";
	  }
	}
	kids += "</select>";
	adults +="</select>";
	
	document.getElementById("Sadults").innerHTML = adults;
	document.getElementById("Skids").innerHTML = kids;
	}
	
	function roomType(value){
	room(value);
	}
	</script>
	
	
</body>

</html>