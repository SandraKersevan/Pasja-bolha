<!doctype html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

		<title>Vse pasme</title>
		<link rel="stylesheet" href="/static/vse_pasme.css" type="text/css"/> 
	</head>
  
	<body>
		<div id="glava">
			<b><a href="../" style="color:black">PASJA BOLHA</a></b>
		</div>
		<h1>Vse pasme</h1>
		<div id="vsebina">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
		<br>
		<center>
		<table border="1" id="myTable">
			<tr>
				<th onclick="sortTable(0)">Ime pasme</th>
				<th onclick="sortTable(1)">Primeren za stanovanja</th>
				<th onclick="sortTable(2)">Primeren za začetnike</th>
				<th  onclick="sortTable(3)">Občutljivost pasme</th>
				<th  onclick="sortTable(4)">Prenese samoto</th>
				<th  onclick="sortTable(5)">Primeren za hladno podnebje</th>
				<th  onclick="sortTable(6)">Primeren za toplo podnebje</th>
				<th  onclick="sortTable(7)">Primeren za družine</th>
				<th  onclick="sortTable(8)">Prijazen do otrok</th>
				<th  onclick="sortTable(9)">Prijazen do drugih psov</th>
				<th  onclick="sortTable(10)">Prijazen do tujcev</th>
				<th  onclick="sortTable(11)">Izpadanje dlake</th>
				<th  onclick="sortTable(12)">Slinjenje</th>
				<th  onclick="sortTable(13)">Nezahtevnost dlake</th>
				<th  onclick="sortTable(14)">Splošno zdravje</th>
				<th  onclick="sortTable(15)">Nagnjenost k debelosti</th>
				<th  onclick="sortTable(16)">Velikost pasme</th>
				<th  onclick="sortTable(17)">Učljivost pasme</th>
				<th  onclick="sortTable(18)">Inteligenca pasme</th>
				<th  onclick="sortTable(19)">Nagnjenost k grizenju</th>
				<th  onclick="sortTable(20)">Lovski nagon pasme</th>
				<th  onclick="sortTable(21)">Nagnjenost k lajanju</th>
				<th  onclick="sortTable(22)">Nagnjenost k potepanju</th>
				<th  onclick="sortTable(23)">Potreba po gibanju</th>
				<th  onclick="sortTable(24)">Energičnost pasme</th>
				<th  onclick="sortTable(25)">Inteziteta pasme</th>
				<th  onclick="sortTable(26)">Igrivost pasme</th>
				<th  onclick="sortTable(27)">Družina</th>
				<th  onclick="sortTable(28)">Minimalna višina (v cm)</th>
				<th  onclick="sortTable(29)">Maksimalna višina (v cm)</th>
				<th  onclick="sortTable(30)">Minimalna teža (v kg)</th>
				<th  onclick="sortTable(31)">Maksimalna teža (v kg)</th>
				<th  onclick="sortTable(32)">Minimalna življenska doba</th>
				<th onclick="sortTable(33)">Maksimalna življenska doba</th>
			</tr>
			%for [slovensko_ime, anglesko_ime, primernost_za_stanovanja, primernost_za_zacetnike,
            % obcutljivost, prenese_samoto, primernost_za_hladno_podnebje,
            % primernost_za_toplo_podnebje, primernost_za_druzine, prijaznost_do_otrok,
            % prijaznost_do_drugih_psov, prijaznost_do_tujcev, izpadanje_dlake, slinjenje,
            % nezahtevnost_dlake, splosno_zdravje, potencial_za_debelost, velikost,
            % ucljivost, inteligenca, grizenje, lovski_pes, lajanje, potepanje, potreba_po_gibanju,
            % energicnost, intenzivnost, igrivost, druzina, min_visina, max_visina, min_teza,
            % max_teza, min_zivljenska_doba, max_zivljenska_doba] in vse_pasme:
			<tr>
				<td><a href="https://dogtime.com/dog-breeds/{{anglesko_ime}}#/slide/1" style="color:black">{{slovensko_ime}}</a></td>
				<td>{{primernost_za_stanovanja}}</td>
			    <td>{{primernost_za_zacetnike}}</td>
				<td>{{obcutljivost}}</td>
				<td>{{prenese_samoto}}</td>
			    <td>{{primernost_za_hladno_podnebje}}</td>
				<td>{{primernost_za_toplo_podnebje}}</td>
				<td>{{primernost_za_druzine}}</td>
			    <td>{{prijaznost_do_otrok}}</td>
				<td>{{prijaznost_do_drugih_psov}}</td>
				<td>{{prijaznost_do_tujcev}}</td>
			    <td>{{izpadanje_dlake}}</td>
				<td>{{slinjenje}}</td>
				<td>{{nezahtevnost_dlake}}</td>
			    <td>{{splosno_zdravje}}</td>
				<td>{{potencial_za_debelost}}</td>
				<td>{{velikost}}</td>
			    <td>{{ucljivost}}</td>
				<td>{{inteligenca}}</td>
				<td>{{grizenje}}</td>
			    <td>{{lovski_pes}}</td>
				<td>{{lajanje}}</td>
				<td>{{potepanje}}</td>
			    <td>{{potreba_po_gibanju}}</td>
				<td>{{energicnost}}</td>
				<td>{{intenzivnost}}</td>
			    <td>{{igrivost}}</td>
				<td>{{druzina}}</td>
				<td>{{min_visina}}</td>
			    <td>{{max_visina}}</td>
				<td>{{min_teza}}</td>
				<td>{{max_teza}}</td>
			    <td>{{min_zivljenska_doba}}</td>
				<td>{{max_zivljenska_doba}}</td>
			</tr>
		% end
		</table>
		</center>
		
		<div>
		<br>
		<br>
		</div>
	</tbody>
	
	<script>
		function sortTable(n) {
		  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
		  table = document.getElementById("myTable");
		  switching = true;
		  // Set the sorting direction to ascending:
		  dir = "asc"; 
		  /* Make a loop that will continue until
		  no switching has been done: */
		  while (switching) {
			// Start by saying: no switching is done:
			switching = false;
			rows = table.rows;
			/* Loop through all table rows (except the
			first, which contains table headers): */
			for (i = 1; i < (rows.length - 1); i++) {
			  // Start by saying there should be no switching:
			  shouldSwitch = false;
			  /* Get the two elements you want to compare,
			  one from current row and one from the next: */
			  x = rows[i].getElementsByTagName("TD")[n];
			  y = rows[i + 1].getElementsByTagName("TD")[n];
			  /* Check if the two rows should switch place,
			  based on the direction, asc or desc: */
			  if (dir == "asc") {
				if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
				  // If so, mark as a switch and break the loop:
				  shouldSwitch = true;
				  break;
				}
			  } else if (dir == "desc") {
				if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
				  // If so, mark as a switch and break the loop:
				  shouldSwitch = true;
				  break;
				}
			  }
			}
			if (shouldSwitch) {
			  /* If a switch has been marked, make the switch
			  and mark that a switch has been done: */
			  rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			  switching = true;
			  // Each time a switch is done, increase this count by 1:
			  switchcount ++; 
			} else {
			  /* If no switching has been done AND the direction is "asc",
			  set the direction to "desc" and run the while loop again. */
			  if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			  }
			}
		  }
		}
	</script>
	
	<br>
	
   
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>