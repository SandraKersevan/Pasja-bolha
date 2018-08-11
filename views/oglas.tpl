<!doctype html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

		<title>{{pasma}}</title>
		<link rel="stylesheet" href="/static/idealni_psi.css" type="text/css"/> 
	</head>
  
	<body>
		<div id="glava">
			<b>PASJA BOLHA</b>
		</div>
		<h1>{{pasma}}</h1>
		<div id="vsebina">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
		
			
		<div id="wrap">
		<table id="tabela">
   	          		<colgroup>
						<col style="width:50%">
						<col style="width:50%">
					</colgroup>
					
					<tbody>
						<tr>
							<td>
							<center>
							<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
								<div class="carousel-item active">
								  <img class="d-block w-100" style="height:300px;max-width:600px;width: expression(this.width > 600 ? 600: true);" src="{{slika}}" alt="First slide">
								</div>
								<div class="carousel-item">
								  <img class="d-block w-100" style="height:300px;max-width:600px;width: expression(this.width > 600 ? 600: true);" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPpAd3yRIIxi5z8WDn-vileb-mPEcjWNKTdZZzJ8tzc5GvLhIz" alt="Second slide">
								</div>
								<div class="carousel-item">
								  <img class="d-block w-100" style="height:300px;max-width:600px;width: expression(this.width > 600 ? 600: true);" src="http://suggestnepal.com/wp-content/uploads/2014/08/kabini-image3.jpg" alt="Third slide">
								</div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							  </a>
							</div>
							</center>
							</td>
							
							<td>
							<h4>Splošne informacije</h4>
							<br>
							%if st_samick != 0:
								<img style="height:40px;max-width:400px;width: expression(this.width > 400 ? 400: true);" src="http://www.clker.com/cliparts/E/8/n/2/2/W/pink-paw-print-md.png">
								{{st_samick}}  &nbsp;&nbsp;
							%end
							%if st_samckov != 0:
								<img style="height:40px;max-width:400px;width: expression(this.width > 400 ? 400: true);" src="https://rlv.zcache.com/light_baby_blue_paw_print_pawprint_ceramic_knob-r8fe035ad557949d3b7ee08d9e8ca2e64_zp2d5_307.jpg?rlvnet=1&rvtype=content">
								{{st_samckov}}
							%end
							<br>
							<br>
							<p>Skotitev: {{skotitev}}</p>
							<p>Cena: {{cena}}</p>
							<p>Pes {{rodovnik}}, {{veterinarska_oskrba}} veterinarsko oskrbljen, {{cepljenje}} cepljen in {{kastracija_sterilizacija}} kastriran/steriliziran.</p>
							</td>
					    </tr>
					</tbody>
				</table>
	
		</div>
		
		<div>
		<br>
		<h4>Prodajalec o psu</h4>
		<p>{{opis}}</p>
		<br>
		<h4>Kontakni podatki</h4>
		<p>Prodajalec prihaja iz {{regija}}.</p>
		%if telefon != False:
			<p>Telefonska številka: {{telefon}}</p>
		%end
		%if email != False:
			<p>Email: {{email}}</p>
		%end
		</div>
			
		<div>
		<br>
		<h3>Komentarji</h3>
		<p>Še ni oddanih komentarjev.</p>
		<table class="table table-striped"  width="100%">
			<col width="20%">
			<col width="80%">
			<tbody>
				<tr>
					<td scope="row"><b>Uporabniško ime</b><br /> <small>4.8.2018</small> </td>
					<td>Lep pes. Je še na voljo?</td>
				</tr>
				<tr>
					<td scope="row"><b>Uporabniško ime</b><br /> <small>5.8.2018</small> </td>
					<td>Žal so vsi oddani.</td>
				</tr>
				<tr>
					<td scope="row"><b>Uporabniško ime</b><br /> <small>6.8.2018</small> </td>
					<td>American Bulldogs are generally happy, family-loving dogs that do well in homes where they have plenty of space to roam. A big, fenced-in backyard is practically a must-have for one of these energetic dogs, though exercise needs may vary by specific type and breeding. They may be just fine with urban life, so long as they get plenty of walks, and they can even make good jogging or running buddies. They do not, however, take very well to being left alone for long periods of time, and they can feel cooped up in an apartment. If their physical and mental stimulation needs aren't met, they can become bored and destructive. American Bulldogs need experienced owners who can be patient with training and start socialization early. So long as they are well trained, they'll get along just fine with children and other pets, though it is still important to supervise them as you would with any dog. Whether they are used for hunting and farm work or just cuddling up with their humans, the American Bulldog makes for an excellent, loyal companion and a competent watchdog.</td>
				</tr>
			</tbody>
		</table>
		<br>
		<input type="comment" class="form-control" id="comment" placeholder="Napiši komantar..." name="comment">
		<span style="float:right;">
				<button class="btn btn-outline-secondary btn-sm" role="button" aria-pressed="true">Oddaj komentar</button>
		</span>
		<br>
		<br>
		</div>
	</tbody>
	

    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>