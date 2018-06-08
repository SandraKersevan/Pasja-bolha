﻿<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    <title>Registracija</title>
    <link rel="stylesheet" href="/static/registracija.css" type="text/css"/> 
  </head>
  
  <body>
    <div id="glava">
		<b>PASJA BOLHA</b>
    </div>
    <h1>Registracija</h1>
    <div id="vsebina">
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
	<br>
	<div class="container">
		<form class="form-signin" role="form" method="post" action=".">
		
		<form>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputName" class="form-text">Ime</label>
				<input type="name" class="form-control" id="inputName" placeholder="Janez" required>
			</div>
		<div class="form-group col-md-6">
			<label for="inputSurname" class="form-text">Priimek</label>
			<input type="surname" class="form-control" id="inputSurname" placeholder="Novak" required>
		</div>
		</div>
		  
		<div class="form-group">
			<label for="inputAddress" class="form-text">Naslov</label>
			<input type="text" class="form-control" id="inputAddress" placeholder="Pasja uta 1" required>
		</div>
		  
		<div class="form-row">
			<div class="form-group col-md-3" style="height:70px">
				<label for="inputState" class="form-text">Pošta</label>
				<select id="inputState" class="form-control" required>
					<option selected>Izberi..</option>
					%for posta in poste:
						<option value="posta">{{posta}}</option></a></li>
					%end
				</select>
			</div>
			<div class="form-group col-md-9">
				<label for="inputCity" class="form-text">Kraj</label>
				<input type="text" class="form-control" id="inputCity" required>
			</div>
		</div>
		  
		<div class="form-row">
			<div class="form-group col-md-6" style="height:70px">
				<label for="inputRegion" class="form-text">Regija</label>
				<select id="inputRegion" class="form-control" required>
					<option selected>Izberi..</option>
					<option>...</option>
				</select>
			</div>

			<div class="form-group col-md-6">
				<label for="inputCountry" class="form-text">Država</label>
				<input type="text" class="form-control" id="inputCountry" placeholder="Slovenija" disabled>
			</div>
		</div>
		
		<br>
		
		<div class="form-group">
			<label for="inputEmail" class="form-text">Email</label>
			<input type="text" class="form-control" id="inputEmail" placeholder="janez.novak@pasjabolha.si" required>
		</div>
		
		<div class="form-group">
			<label for="inputNumber" class="form-text">Telefonska številka</label>
			<input type="text" class="form-control" id="inputNumber" placeholder="030 123 123" required>
		</div>
		
		<br>
		
		<div class="form-group">
			<label for="inputUsername" class="form-text">Uporabniško ime</label>
			<input type="text" class="form-control" id="inputUsername" placeholder="JanezN" required>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputPassword1" class="form-text">Geslo</label>
				<input type="password" class="form-control" id="inputPassword1" required>
			</div>

			<div class="form-group col-md-6">
				<label for="inputPassword2" class="form-text">Ponovi geslo</label>
				<input type="password" class="form-control" id="inputPassword2" required>
			</div>
		</div>
		
		<br>

		<div>
			<a href="/oglasi/" type="submit" class="btn btn-outline-secondary" role="button" aria-pressed="true">Registriraj se</a>
		</div>
		
		<br>
	</form>

	</form>
	</div> <!-- /container -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>