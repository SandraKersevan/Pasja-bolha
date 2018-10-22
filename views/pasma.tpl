<!doctype html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

		<title>{{slo_ime}}</title>
		<link rel="stylesheet" href="/static/pasma.css" type="text/css"/> 
	</head>
  
	<body>
		<div id="glava">
			<b><a href="../" style="color:black">PASJA BOLHA</a></b>
		</div>
		<h1>{{slo_ime}}</h1>
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
				<p>{{slo_ime}} spada v družino {{druzina}}.</p>
				<p>{{slo_ime}} zraste od {{min_visina}} do {{max_visina}} cm.</p>
				<p>{{slo_ime}} tehta od {{min_teza}} do {{max_teza}} kg.</p>
				<p>{{slo_ime}} živi od {{min_leta}} do {{max_leta}} let.</p>
				<br>
				<p>Več o pasmi si lahko preberete <a href="https://dogtime.com/dog-breeds/{{ang_ime}}#/slide/1" style="color:black">tukaj</a> (v angleščini).</p>
			</td>
		  </tr>
		</table>
		</center>
		
		<div>
		<br>
		<h4>Lastnosti</h4>
		<center>
		<table border="0" width="100%">
		<colgroup>
			<col style="width:25%">
			<col style="width:75%">
		</colgroup>
		  <tr>
			<td height="60"> Primeren za bivanje v stanovanju </td>
			<td height="60" margin-left: 10px>
			%for i in range(0,stanovanje):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Primeren za začetnike</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,zacetnik):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Občutljivost pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,obcutljivost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Prenese samoto</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,samota):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60"> Primeren za hladno podnebje </td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,hladno):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Primeren za toplo podnebje</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,toplo):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Primeren za druzine</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,druzine):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Prijazen do otrok</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,otroci):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Prijazen do drugih psov</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,psi):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Prijazen do tujcev</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,tujci):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Izpadanje dlake</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,izp_dlake):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60"> Slinjenje </td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,slina):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Nezahtevnost dlake</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,nez_dlake):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Splošno zdravje</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,zdravje):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Nagnjenost k debelosti</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,debelost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Velikost pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,velikost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Učljivost pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,ucljivost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Inteligenca pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,inteligenca):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr><tr>
			<td height="60">Nagnjenost k grizenju</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,grizenje):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Lovski nagon pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,lovec):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Nagnjenost k lajanju</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,lajanje):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Nagnjenost pasme k potepanju</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,potepanje):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Potreba po gibanju</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,gibanje):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Energičnost pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,energicnost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Inteziteta pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,intenzivnost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		  <tr>
			<td height="60">Igrivost pasme</td>
			<td height="60" margin-left: 10px> 
			%for i in range(0,igrivost):
				<img src="/static/pasjataca.png">
			%end
			</td>
		  </tr>
		</table>
		</center>
		
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