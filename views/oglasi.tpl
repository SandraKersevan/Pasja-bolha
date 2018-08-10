<!doctype html>
<html lang="en">

	<style>
	a:link, a:visited {
		background-color: White;
		color: Black;
		padding: 14px 25px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		border-style: solid;
		border-width: 0.2px;
		border-color: Grey;
	}

	a:hover, a:active {
		background-color: White;
	}
	</style>
	
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

		<title>Aktualni oglasi</title>
		<link rel="stylesheet" href="/static/oglasi.css" type="text/css"/> 
		
	</head>
  
	<body>
		<div id="glava">
			<b>PASJA BOLHA</b>
		</div>
		<h1>Aktualni oglasi</h1>
		<div id="vsebina">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
		<style type="text/css">
			#wrap {
			   width:800px;
			   margin:0 auto;
			}
			#left_col {
			   float:left;
			   width:400px;
			}
			#right_col {
			   float:right;
			   width:400px;
			   align: left;
			}
		</style>
		
		<form class="form-signin" role="form" method="post" action=".">
		
		<p style="text-align:left;">
			<br>
			Prijavljeni ste kot  <b><u>{{username}}</u> </b>
			<br> 
			<button href="" class="btn btn-outline-secondary btn-sm" role="button" aria-pressed="true">Začetna stran</button>
			
			<span style="float:right;">
				<button href="/ustvari_oglas/" class="btn btn-outline-secondary btn-sm" role="button" aria-pressed="true">Ustvari oglas</button>
			</span>
		</p>
		
		<center>
		%for (id_oglasa,slika,pasma,cena,regija,st_samick,st_samckov) in oglasi:
			<a href="/oglas/{{id_oglasa}}" style="display:block;width:800px; height:300px" target="_blank" align="center">
				<div id="wrap">
					<div id="left_col">
						<img style="height:280px;max-width:400px;width: expression(this.width > 400 ? 400: true);" src="{{slika}}"">
					</div>
				
					<div id="right_col">
						<br>
						<h3>{{pasma}}</h3>
						<br>
						%if st_samick != 0:
							<img style="height:40px;max-width:400px;width: expression(this.width > 400 ? 400: true);" src="http://www.clker.com/cliparts/E/8/n/2/2/W/pink-paw-print-md.png"> &nbsp;&nbsp; 
						%end
						%if st_samckov != 0:
							<img style="height:40px;max-width:400px;width: expression(this.width > 400 ? 400: true);" src="https://rlv.zcache.com/light_baby_blue_paw_print_pawprint_ceramic_knob-r8fe035ad557949d3b7ee08d9e8ca2e64_zp2d5_307.jpg?rlvnet=1&rvtype=content">
						%end
						<br>
						<br>
						<p>{{cena}}</p>
						<p>{{regija}}</p>
						<br>
					</div>
				</div>
			</a>
		<br>
		%end
		</center>

			
	</tbody>
	

    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>