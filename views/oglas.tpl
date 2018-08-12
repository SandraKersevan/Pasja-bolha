<!doctype html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

		<title>{{pasma}}</title>
		<link rel="stylesheet" href="/static/oglas.css" type="text/css"/> 
	</head>
  
	<body>
		<div id="glava">
			<b><a href="../" style="color:black">PASJA BOLHA</a></b>
		</div>
		<h1>{{pasma}}</h1>
		<div id="vsebina">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
		
		<br>
		<center>
		<table border="0" width="100%">
		<colgroup>
			<col style="width:50%">
			<col style="width:50%">
		</colgroup>
		  <tr>
			<td height="350" width="500">
			<center>
			<img style="max-height:350px;max-width:500px;width:auto;height:auto;" src="{{slika}}" alt="First slide">
			</center>
			</td>
			<td height="350" margin-left: 10px>
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
				<p>Pes {{rodovnik}}, {{veterinarska_oskrba}} veterinarsko oskrbljen, {{cepljenje}} cepljen in {{kastracija_sterilizacija}} kastriran/steriliziran.</p>					<p>Več o pasmi si lahko preberete <a href="https://dogtime.com/dog-breeds/{{anglesko_ime}}#/slide/1" style="color:grey">tukaj</a>.</p>
							
			</td>
		  </tr>
		</table>
		</center>
		
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
		%if popravljeni_komentarji == []:
			<p>Še ni oddanih komentarjev.</p>
		%end
		%if popravljeni_komentarji != []:
			<table class="table table-striped"  width="100%">
				<col width="20%">
				<col width="80%">
				<tbody>
				%for [uporabnisko_ime, vsebina, cas_oddaje] in popravljeni_komentarji:
					<tr>
						<td scope="row"><b>{{uporabnisko_ime}}</b><br /> <small>{{cas_oddaje}}</small> </td>
						<td>{{vsebina}}</td>
					</tr>
				%end
				</tbody>
			</table>
		%end
		<br>
		<form method="post" action="/oglas/{{id_oglasa}}">
		<input type="comment" class="form-control" id="comment" placeholder="Napiši komantar..." name="comment">
		<span style="float:right;">
				<button class="btn btn-outline-secondary btn-sm" type="submit" role="button" aria-pressed="true">Oddaj komentar</button>
		</span>
		</form>
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