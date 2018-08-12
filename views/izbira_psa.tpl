<!doctype html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous"><!-- Required meta tags -->

		<title>Izberi idealno pasmo</title>
		<link rel="stylesheet" href="/static/izbira_psa.css" type="text/css"/> 
	
	</head>
	
	<body>
		<div id="glava">
			<b><a href="../" style="color:black">PASJA BOLHA</a></b>
		</div>
		<h1>Izberi svojo idealno pasmo</h1>
		<div id="vsebina">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
	<br>
	
	<div>
	<form class="form-signin" role="form" method="post" action=".">
	<table class="table">
	<colgroup>
		<col style="width:50%">
		<col style="width:50%">
	</colgroup>
	  <thead class="thead-light">
		<tr>
		  <th scope="col">Splošne lastnosti</th>
		  <th scope="col">1 - sploh se ne strinjam;<br> 3 - niti se strinjam, niti se ne strinjam;<br> 5 - popolnoma se strinjam</th>
		</tr>
	  </thead>
	  <tbody>
		<tr>
		  <th scope="row">Pes bo večino časa v notranjosti</th>
		  <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="notranjost">
					      <label class="btn btn-secondary">
						  <input type="radio" name="notranjost" id="notranjost1" value="notranjost1" autocomplete="off"> 1
					      </label>
					      <label class="btn btn-secondary">
						  <input type="radio" name="notranjost" id="notranjost2" value="notranjost2" autocomplete="off"> 2
					      </label>
					      <label class="btn btn-secondary active">
						  <input type="radio" name="notranjost" id="notranjost3" value="notranjost3" autocomplete="off" checked> 3
					      </label>
					      <label class="btn btn-secondary">
						  <input type="radio" name="notranjost" id="notranjost4" value="notranjost4" autocomplete="off"> 4
					      </label>
					      <label class="btn btn-secondary">
						  <input type="radio" name="notranjost" id="notranjost5" value="notranjost5" autocomplete="off"> 5
					      </label>
			</div>
		  </td>

		</tr>
		<tr>
		  <th scope="row">Nimam izkušenj s psi</th>
		   <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="izkusnje">
				<label class="btn btn-secondary">
					<input type="radio" name="izkusnje" id="izkusnje1" value="izkusnje1" autocomplete="off"> 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="izkusnje" id="izkusnje2" value="izkusnje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="izkusnje" id="izkusnje3" value="izkusnje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="izkusnje" id="izkusnje4" value="izkusnje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="izkusnje" id="izkusnje5" value="izkusnje5" autocomplete="off"> 5
				</label>
			</div>
		  </td>
		</tr>
		<tr>
		  <th scope="row">Želim občutljivo pasmo</th>
		 <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="obcutljivost">
				<label class="btn btn-secondary">
					<input type="radio" name="obcutljivost" id="obcutljivost1" value="obcutljivost1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="obcutljivost" id="obcutljivost2" value="obcutljivost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="obcutljivost" id="obcutljivost3" value="obcutljivost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="obcutljivost" id="obcutljivost4" value="obcutljivost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="obcutljivost" id="obcutljivost5" value="obcutljivost5" autocomplete="off"> 5
				</label>
			</div>
		  </td>
		</tr>
		
		<tr>
			<th scope="row">Pes bo večino časa sam</th>
			<td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="samota">
				<label class="btn btn-secondary">
					<input type="radio" name="samota" id="samota1" value="samota1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="samota" id="samota2" value="samota2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="samota" id="samota3" value="samota3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="samota" id="samota4" value="samota4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="samota" id="samota5" value="samota5" autocomplete="off"> 5
				</label>
			</div>
		  </td>
		</tr>
		
		<tr>
			<th scope="row">Živim v hladnem podnebju</th>
			<td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="hladno">
				<label class="btn btn-secondary">
					<input type="radio" name="hladno" id="hladno1" value="hladno1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="hladno" id="hladno2" value="hladno2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="hladno" id="hladno3" value="hladno3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="hladno" id="hladno4" value="hladno4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="hladno" id="hladno5" value="hladno5" autocomplete="off"> 5
				</label>
			</div>
		  </td>		
		</tr>
		
		<tr>
			<th scope="row">Živim v toplem podnebju</th>
			<td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="toplo">
				<label class="btn btn-secondary">
					<input type="radio" name="toplo" id="toplo1" value="toplo1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="toplo" id="toplo2" value="toplo2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="toplo" id="toplo3" value="toplo3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="toplo" id="toplo4" value="toplo4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="toplo" id="toplo5" value="toplo5" autocomplete="off"> 5
				</label>
			</div>
		  </td>		
	   </tbody>
	</table>
	</div>
		
	<br>
	
	<div>
	<table class="table">
	<colgroup>
		<col style="width:50%">
		<col style="width:50%">
	</colgroup>
	  <thead class="thead-light">
		<tr>
		  <th scope="col">Prijaznost psa</th>
		  <th scope="col">1 - zelo neprijazen;<br> 3 - niti prijazen, niti neprijazen;<br> 5 - zelo prijazen</th>
		</tr>
	  </thead>
	  <tbody>    
		<tr>
			 <th scope="row">Pes je prijazen do družine</th>
		  <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="druzina">
				<label class="btn btn-secondary">
					<input type="radio" name="druzina" id="druzina1" value="druzina1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="druzina" id="druzina2" value="druzina2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="druzina" id="druzina3" value="druzina3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="druzina" id="druzina4" value="druzina4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="druzina" id="druzina5" value="druzina5" autocomplete="off"> 5
				</label>
			</div>
		  </td>		
		</tr>
		
		<tr>
			<th scope="row">Pes je ljubezniv do otrok</th>
			<td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="otroci">
				<label class="btn btn-secondary">
					<input type="radio" name="otroci" id="otroci1" value="otroci1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="otroci" id="otroci2" value="otroci2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="otroci" id="otroci3" value="otroci3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="otroci" id="otroci4" value="otroci4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="otroci" id="otroci5" value="otroci5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>
		
		<tr>
			<th scope="row">Pes se razume z drugimi psi</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="drugi_psi">
				<label class="btn btn-secondary">
					<input type="radio" name="drugi_psi" id="drugi_psi1" value="drugi_psi1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="drugi_psi" id="drugi_psi2" value="drugi_psi2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="drugi_psi" id="drugi_psi3" value="drugi_psi3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="drugi_psi" id="drugi_psi4" value="drugi_psi4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="drugi_psi" id="drugi_psi5" value="drugi_psi5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>
		
		<tr>
			<th scope="row">Pes je prijazen do tujcev</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="tujci">
				<label class="btn btn-secondary">
					<input type="radio" name="tujci" id="tujci1" value="tujci1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="tujci" id="tujci2" value="tujci2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="tujci" id="tujci3" value="tujci3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="tujci" id="tujci4" value="tujci4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="tujci" id="tujci5" value="tujci5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>

	</tbody>
	</table>
	</div>
		
	<br>
	
	<div>	
	<table class="table">
	<colgroup>
		<col style="width:50%">
		<col style="width:50%">
	</colgroup>
	  <thead class="thead-light">
		<tr>
		  <th scope="col">Skrb za psa</th>
		  <th scope="col">1 - minimalno;<br> 3 - srednje;<br> 5 - maksimalno</th>
		</tr>
	  </thead>
	  <tbody>    
		
		<tr>
			<th scope="row">Psu izpada dlake</th>
			<td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="dlaka">
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka" id="dlaka1" value="dlaka1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka" id="dlaka2" value="dlaka2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="dlaka" id="dlaka3" value="dlaka3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka" id="dlaka4" value="dlaka4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka" id="dlaka5" value="dlaka5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>
		
		<tr>
			<th scope="row">Pes se slini</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="slinjenje">
				<label class="btn btn-secondary">
					<input type="radio" name="slinjenje" id="slinjenje1" value="slinjenje1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="slinjenje" id="slinjenje2" value="slinjenje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="slinjenje" id="slinjenje3" value="slinjenje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="slinjenje" id="slinjenje4" value="slinjenje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="slinjenje" id="slinjenje5" value="slinjenje5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>
		
		<tr>
			<th scope="row">Potrebna je skrb za dlako</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="dlaka_skrb">
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka_skrb" id="dlaka_skrb1" value="dlaka_skrb1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka_skrb" id="dlaka_skrb2" value="dlaka_skrb2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="dlaka_skrb" id="dlaka_skrb3" value="dlaka_skrb3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka_skrb" id="dlaka_skrb4" value="dlaka_skrb4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="dlaka_skrb" id="dlaka_skrb5" value="dlaka_skrb5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>
		
		<tr>
			<th scope="row">Pasma je zdrava</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="zdravje">
				<label class="btn btn-secondary">
					<input type="radio" name="zdravje" id="zdravje1" value="zdravje1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="zdravje" id="zdravje2" value="zdravje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="zdravje" id="zdravje3" value="zdravje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="zdravje" id="zdravje4" value="zdravje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="zdravje" id="zdravje5" value="zdravje5" autocomplete="off"> 5
				</label>
			</div>
			</td>		
		</tr>
		
		<tr>
			<th scope="row">Pes je nagnjen k debelosti</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="debelost">
				<label class="btn btn-secondary">
					<input type="radio" name="debelost" id="debelost1" value="debelost1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="debelost" id="debelost2" value="debelost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="debelost" id="debelost3" value="debelost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="debelost" id="debelost4" value="debelost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="debelost" id="debelost5" value="debelost5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Velikost psa</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="velikost">
				<label class="btn btn-secondary">
					<input type="radio" name="velikost" id="velikost1" value="velikost1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="velikost" id="velikost2" value="velikost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="velikost" id="velikost3" value="velikost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="velikost" id="velikost4" value="velikost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="velikost" id="velikost5" value="velikost5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>

	</tbody>
	</table>
	</div>
		
	<br>
	
	<div>	
	<table class="table">
	<colgroup>
		<col style="width:50%">
		<col style="width:50%">
	</colgroup>
	  <thead class="thead-light">
		<tr>
			<th scope="col">Učenje in igra</th>
		  <th scope="col">1 - zelo nepomembno;<br> 3 - niti pomembno, niti nepomembno;<br> 5 - zelo pomembno</th>
		</tr>		
		</thead>
		<tbody>    
		
		<tr>
			<th scope="row">Pes je učljiv</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="ucljivost">
				<label class="btn btn-secondary">
					<input type="radio" name="ucljivost" id="ucljivost1" value="ucljivost1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="ucljivost" id="ucljivost2" value="ucljivost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="ucljivost" id="ucljivost3" value="ucljivost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="ucljivost" id="ucljivost4" value="ucljivost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="ucljivost" id="ucljivost5" value="ucljivost5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes je inteligenten</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="inteligenca">
				<label class="btn btn-secondary">
					<input type="radio" name="inteligenca" id="inteligenca1" value="inteligenca1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="inteligenca" id="inteligenca2" value="inteligenca2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="inteligenca" id="inteligenca3" value="inteligenca3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="inteligenca" id="inteligenca4" value="inteligenca4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="inteligenca" id="inteligenca5" value="inteligenca5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes rad grize</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="grizenje">
				<label class="btn btn-secondary">
					<input type="radio" name="grizenje" id="grizenje1" value="grizenje1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="grizenje" id="grizenje2" value="grizenje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="grizenje" id="grizenje3" value="grizenje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="grizenje" id="grizenje4" value="grizenje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="grizenje" id="grizenje5" value="grizenje5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes ima močan lovski nagon</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="lovski_nagon">
				<label class="btn btn-secondary">
					<input type="radio" name="lovski_nagon" id="lovski_nagon1" value="lovski_nagon1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="lovski_nagon" id="lovski_nagon2" value="lovski_nagon2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="lovski_nagon" id="lovski_nagon3" value="lovski_nagon3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="lovski_nagon" id="lovski_nagon4" value="lovski_nagon4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="lovski_nagon" id="lovski_nagon5" value="lovski_nagon5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes rad laja</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="lajanje">
				<label class="btn btn-secondary">
					<input type="radio" name="lajanje" id="lajanje1" value="lajanje1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="lajanje" id="lajanje2" value="lajanje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="lajanje" id="lajanje3" value="lajanje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="lajanje" id="lajanje4" value="lajanje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="lajanje" id="lajanje5" value="lajanje5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes se rad potepa</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="potepanje">
				<label class="btn btn-secondary">
					<input type="radio" name="potepanje" id="potepanje1" value="potepanje1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="potepanje" id="potepanje2" value="potepanje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="potepanje" id="potepanje3" value="potepanje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="potepanje" id="potepanje4" value="potepanje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="potepanje" id="potepanje4" value="potepanje5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes je energičen</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="energicnost">
				<label class="btn btn-secondary">
					<input type="radio" name="energicnost" id="energicnost1" value="energicnost1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="energicnost" id="energicnost2" value="energicnost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="energicnost" id="energicnost3" value="energicnost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="energicnost" id="energicnost4" value="energicnost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="energicnost" id="energicnost5" value="energicnost5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes se težko utrudi</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="utrujenost">
				<label class="btn btn-secondary">
					<input type="radio" name="utrujenost" id="utrujenost1" value="utrujenost1"  autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="utrujenost" id="utrujenost2" value="utrujenost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="utrujenost" id="utrujenost3" value="utrujenost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="utrujenost" id="utrujenost4" value="utrujenost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="utrujenost" id="utrujenost5" value="utrujenost5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes potrebuje veliko gibanja</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="gibanje">
				<label class="btn btn-secondary">
					<input type="radio" name="gibanje" id="gibanje1" value="gibanje1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="gibanje" id="gibanje2" value="gibanje2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="gibanje" id="gibanje3" value="gibanje3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="gibanje" id="gibanje4" value="gibanje4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="gibanje" id="gibanje5" value="gibanje5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		
		<tr>
			<th scope="row">Pes je igriv</th>
		    <td>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" name="igrivost">
				<label class="btn btn-secondary">
					<input type="radio" name="igrivost" id="igrivost1" value="igrivost1" autocomplete="off" > 1
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="igrivost" id="igrivost2" value="igrivost2" autocomplete="off"> 2
				</label>
				<label class="btn btn-secondary active">
					<input type="radio" name="igrivost" id="igrivost3" value="igrivost3" autocomplete="off" checked> 3
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="igrivost" id="igrivost4" value="igrivost4" autocomplete="off"> 4
				</label>
				<label class="btn btn-secondary">
					<input type="radio" name="igrivost" id="igrivost5" value="igrivost5" autocomplete="off"> 5
				</label>
			</div>
			</td>
		</tr>
		

		
	</tbody>
	</table>

	</div>  

	<br>
	
	<p align="right">
	<button class="btn btn-secondary" type="submit" align="center">Poišči psa!</button>
	</p>
	
	<br>
	<br>
	</form>     
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>




