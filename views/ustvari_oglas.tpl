<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    <title>Ustvari oglas</title>
    <link rel="stylesheet" href="/static/registracija.css" type="text/css"/> 
  </head>
  
  <body>
    <div id="glava">
		<b>PASJA BOLHA</b>
    </div>
    <h1>Ustvari oglas</h1>
    <div id="vsebina">
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    
	<br>
	<div class="container">
		<form class="form-signin" role="form" method="post" action=".">
		
		<form>
		
		<h3>Informacije o psu/psih</h3>
		
		<div class="form-row">
			<label for="inputBreed" class="form-text">Pasma</label>
			<select id="inputBreed" class="form-control" name="pasma" required>
				<option selected value="300">Izberi...</option>
					%for (pasma, id_pasme) in pasme:
						<option value={{id_pasme}}>{{pasma}}</option>
					%end
			</select>
		</div>
		
		<div class="form-group">
			<label for="inputDescription" class="form-text">Opis</label>
			<textarea cols="107" rows="5" id="inputDescription" placeholder="Opis..." name="opis" required></textarea>
		</div>

		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputDate" class="form-text">Skotitev:</label>
			</div>

			<div class="form-group col-md-11">
				<input type="date" id="inputDate" min='2000-01-01' max='2018-08-01' name="skotitev" required>
			</div>
		</div>
		
		<script language='javascript' type='text/javascript'>
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			if(dd<10){
				dd='0'+dd
			} 
			if(mm<10){
				mm='0'+mm
			} 

			today = yyyy+'-'+mm+'-'+dd;
			document.getElementById("inputDate").setAttribute("max", today);
		</script>
		
		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputPassword1" class="form-text">Cena:</label>
			</div>

			<div class="form-group col-md-11">
				<input type="number" value="0" min='0' class="form-control" id="cena" name="cena" required>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-1">
				<label for="inputFemale" class="form-text">Samičke:</label>
			</div>

			<div class="form-group col-md-5">
				<input type="number" value="0" min='0' class="form-control" id="inputFemale" name="samicke" required>
			</div>
			
			<div class="form-group col-md-1">
				<label for="inputMale" class="form-text">Samčki:</label>
			</div>

			<div class="form-group col-md-5">
				<input type="number" value="0" min='0' class="form-control" id="inputMale" name="samcki" oninput="check(this)" required>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="rodovnik" class="form-text">Pes ima rodovnik.</label>
			</div>

			<div class="form-group col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="rodovnik" id="da" value="da" autocomplete="off" checked="checked" > Da
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="rodovnik" id="ne" value="ne" autocomplete="off"> Ne
				</label>
			</div>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="inputPassword1" class="form-text">Pes je veterinarsko oskrbljen.</label>
			</div>

			<div class="form-group col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="veterinar" id="da" value="da" autocomplete="off" checked="checked"> Da
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="veterinar" id="ne" value="ne" autocomplete="off"> Ne
				</label>
			</div>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="inputPassword1" class="form-text">Pes je redno cepljen.</label>
			</div>

			<div class="form-group col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="cepljenje" id="da" value="da" autocomplete="off" checked="checked" > Da
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="cepljenje" id="ne" value="ne" autocomplete="off"> Ne
				</label>
			</div>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="inputPassword1" class="form-text">Pes je kastriran/steriliziran.</label>
			</div>

			<div class="form-group col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="kastracija" id="da" value="da" autocomplete="off" checked="checked"> Da
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="kastracija" id="ne" value="ne" autocomplete="off"> Ne
				</label>
			</div>
			</div>
		</div>
		
		
		<div class="form-row">
			<div class="form-group col-md-2">
				<label for="inputPicture" class="form-text">Naloži sliko.</label>
			</div>

			<div class="form-group col-md-10">
				<input type="file" id="inputPicture" name="slike" multiple>
			</div>
		</div>
		
		<script language='javascript' type='text/javascript'> <!-- Ne dela - naj bi omejil število dodanih slik -->
			$(function(){
				$("input[type='submit']").click(function(){
					var $fileUpload = $("input[type='file']");
					if (parseInt($fileUpload.get(0).files.length)>4){
						alert("Naložite lahko le 4 fotografije.");
					}
				});    
			});​
		</script>
		<br>
		
		<h3>Informacije o lastniku</h3>
				

		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="inputPassword1" class="form-text">Pokaži moj email.</label>
			</div>

			<div class="form-group col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="email" id="emailda" value="da" autocomplete="off" checked="checked"> Da
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="email" id="emailne" value="ne" autocomplete="off"> Ne
				</label>
			</div>
			</div>
		</div>
		
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="inputPassword1" class="form-text">Pokaži mojo tel. številko.</label>
			</div>

			<div class="form-group col-md-8">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-secondary active">
					<input type="radio" name="telefon" id="telefonda" value="da" autocomplete="off" checked="checked"> Da
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="telefon" id="telefonne" value="ne" autocomplete="off"> Ne
				</label>
			</div>
			</div>
		</div>	
		<br>
		<div>
			<button href="/oglasi/" class="btn btn-outline-secondary btn-lg" style="float: right;" onclick="check(this); check2(this); check3(this)" role="button" aria-pressed="true">Oddaj oglas</button>
		</div>
		
		<br>
		<br>
		<br>
	</form>

	</form>
	
			<script language='javascript' type='text/javascript'>
				function check(input) {
					const inputBreedElm = document.getElementById('inputBreed');
					if (inputBreedElm.value == "300") {
						inputBreedElm.setCustomValidity('Izberi pasmo.');
					} else {
						// input is valid -- reset the error message
						inputBreedElm.setCustomValidity('');
					}
				}
				
				function check2(input) {
					const inputSexElm = document.getElementById('inputMale');
					if (document.getElementById('inputFemale').value == 0 && document.getElementById('inputMale').value == 0) {
						inputSexElm.setCustomValidity('Oglas mora vsebovati vsaj eno žival.');
					} else {
						// input is valid -- reset the error message
						inputSexElm.setCustomValidity('');
							}
					}
				
				function check3(input) {
					const inputPhoneElm = document.getElementById('telefonne');
					if (document.getElementById('emailne').checked && document.getElementById('telefonne').checked) {
						// alert("One must be yes.");
						inputPhoneElm.setCustomValidity('Vsaj eden mora biti da.');
					} else {
						// input is valid -- reset the error message
						inputPhoneElm.setCustomValidity('');
							}
					}
			</script>
	</div> <!-- /container -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>