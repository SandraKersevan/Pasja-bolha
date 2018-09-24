<!doctype html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

		<title>Idealni psi</title>
		<link rel="stylesheet" href="/static/idealni_psi.css" type="text/css"/> 
	</head>
  
	<body>
		<div id="glava">
			<b><a href="../" style="color:black">PASJA BOLHA</a></b>
		</div>
		<h1>Idealni psi za vas</h1>
		<div id="vsebina">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
		<form role="form" method="post" action=".">
			<div id="wrap">
				<br>
				<h4>Rezultati, glede na vašo izbiro parametrov:</h4>
				<p>{{izbrano}}</p>
				<br>
					
				<table id="tabela">
   	          		<colgroup>
						<col style="width:20%">
						<col style="width:80%">
					</colgroup>
					
					<tbody>
					%for (ime, ang_ime, slika) in psi:
						<tr>
							<td><img src="{{slika}}"></td>
							<td><a href="https://dogtime.com/dog-breeds/{{ang_ime}}#/slide/1" style="color:black">{{ime}}</a></td>
					    </tr>
					%end
					</tbody>
				</table>
				<br>
				
				<p>Vse pasme in njihove lastnosti pa si lahko ogledate <a href="http://localhost:8080/vse_pasme/" style="color:black">tukaj</a>.</p>
				<p align="right">
				<button href="/izbira_psa/" type="submit" class="btn btn-outline-dark btn-lg">Nazaj</button>
				</p>
				
				
				
				<br>
			</div>
		</form>
		</div>
	</tbody>
	

    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>