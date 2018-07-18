<!doctype html>
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
  <form role="form" method="get">
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
			<div class="form-group col-md-8" style="height:70px">
				<label for="inputState" class="form-text">Pošta</label>
				<select required id="inputState" class="form-control">
					<option selected>Izberi..</option>
					%for posta in stevilka_posta:
						<option value="posta">{{posta}}</option></a></li>
					%end
				</select>
			</div>

			<div class="form-group col-md-4">
				<label for="inputCountry" class="form-text">Država</label>
				<input type="text" class="form-control" id="inputCountry" placeholder="Slovenija" disabled>
			</div>
		</div>
		
		<br>
		
		<div class="form-group">
			<label for="inputEmail" class="form-text">Email</label>
			<input type="email" class="form-control" id="inputEmail" placeholder="janez.novak@pasjabolha.si" required>
		</div>
		
		<div class="form-group">
			<label for="inputNumber" class="form-text">Telefonska številka</label>
			<input type="number" class="form-control" id="inputNumber" placeholder="030123123" required>
		</div>
		
		<br>
		
		<div class="form-group">
			<label for="inputUsername" class="form-text">Uporabniško ime</label>
			<input type="text" class="form-control" id="inputUsername" placeholder="JanezN" required>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputPassword1" class="form-text">Geslo</label>
				<input type="password" class="form-control" id="inputPassword1" name="inputPassword1" required>
			</div>

			<div class="form-group col-md-6">
				<label for="inputPassword2" class="form-text">Ponovi geslo</label>
				<input type="password" class="form-control" id="inputPassword2" name="inputPassword2" oninput="check(this)" required>
			</div>
			
			<script language='javascript' type='text/javascript'>
				function check(input) {
					if (input.value != document.getElementById('inputPassword1').value) {
						input.setCustomValidity('Gesli se morata ujemati.');
					} else {
						// input is valid -- reset the error message
						input.setCustomValidity('');
							}
					}
			</script>
		</div>
		
		<br>
		
		<div>
			<button href="/oglasi/" type="submit" class="btn btn-outline-secondary" role="button" aria-pressed="true">Registriraj se</button>
		</div>
		
		<br>
	</form>

	</form>
	</div> 

		
		<!-- /container -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </form>
  </body>
</html>