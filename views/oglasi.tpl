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
			<b><a href="../"  style="display:initial;background-color:transparent;border:0;color:black">PASJA BOLHA</a></b>
		</div>
		<h1>Aktualni oglasi</h1>
		<div id="vsebina">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
		
		<style type="text/css">
			#wrap {
			   width:900px;
			   margin:0 auto;
			}
			#left_col {
			   float:left;
			   width:400px;
			}
			#right_col {
			   float:right;
			   width:500px;
			   align: left;
			}
		</style>
		
		<br>
		<center>
		<table border="0" width="100%">
		<colgroup>
			<col style="width:50%">
			<col style="width:50%">
		</colgroup>
		  <tr>
			<td height="20">
			Prijavljeni ste kot  <b><u>{{username}}</u></b> 
			</td>
			<td height="20">
			<form method="get" action="/ustvari_oglas/">
			<span style="float:right;">
				<button class="btn btn-outline-secondary btn-sm" role="button" aria-pressed="true">Ustvari oglas</button>
			</span>	
			</td>
		  </tr>
		  
		  <tr>
			<td height="40">
			</td>
			<td height="40">
			</td>
		  </tr>
		</table>
		</center>
		
		<center>
		<table border="0" width="100%">
		<colgroup>
			<col style="width:13%">
			<col style="width:87%">
		</colgroup>
		  <tr>
			<td height="20">
			<label for="razvrscanje" class="form-text" style="float:right;">Razvrsti oglase po: &nbsp</label> 
			</td>
			<td height="20">
			%if razvrstitev == "starost_oglasa_nar":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option selected value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "starost_oglasa_pad":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option selected value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "starost_psa_nar":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option selected value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "starost_psa_pad":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option selected value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "abeceda_az":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option selected value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "abeceda_za":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option selected value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "cena_nar":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option selected value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			% elif razvrstitev == "cena_pad":
			<select id="razvrscanje" class="form-control" name="" style="width:250px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/starost_oglasa_nar/{{st_oglasov}}/1">Starost oglasa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_oglasa_pad/{{st_oglasov}}/1">Starost oglasa padajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_nar/{{st_oglasov}}/1">Starost psa naraščajoče</option>
					<option value="http://localhost:8080/oglasi/starost_psa_pad/{{st_oglasov}}/1">Starost psa padajoče</option>
					<option value="http://localhost:8080/oglasi/abeceda_az/{{st_oglasov}}/1">Abecedni vrstni red (A-Ž)</option>
					<option value="http://localhost:8080/oglasi/abeceda_za/{{st_oglasov}}/1">Abecedni vrstni red (Ž-A)</option>
					<option value="http://localhost:8080/oglasi/cena_nar/{{st_oglasov}}/1">Cena naraščajoče</option>
					<option selected value="http://localhost:8080/oglasi/cena_pad/{{st_oglasov}}/1">Cena padajoče</option>
			</select>
			%end
			</td>
		  </tr>
		  
		    <script type="text/javascript">
				window.onload = function(){
					location.href=document.getElementById("selectbox").value;
				}       
			</script>

				  
		  <tr>
			<td height="20">
			<label for="stevilo_oglasov" class="form-text" style="float:right;">Na stran pokaži: &nbsp</label>
			</td>
			<td height="20">
			% if st_oglasov == "5":
			<select id="stevilo_oglasov" class="form-control" name="razvrscanje" style="width:130px;" onchange="javascript:location.href = this.value;">
					<option selected value="http://localhost:8080/oglasi/{{razvrstitev}}/5/1">5 oglasov</option>
					<option value="http://localhost:8080/oglasi/{{razvrstitev}}/10/1">10 oglasov</option>
					<option value="http://localhost:8080/oglasi/{{razvrstitev}}/vsi/1">Vse oglase</option>
			</select>
			% elif st_oglasov == "10":
			<select id="stevilo_oglasov" class="form-control" name="razvrscanje" style="width:130px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/{{razvrstitev}}/5/1">5 oglasov</option>
					<option selected value="http://localhost:8080/oglasi/{{razvrstitev}}/10/1">10 oglasov</option>
					<option value="http://localhost:8080/oglasi/{{razvrstitev}}/vsi/1">Vse oglase</option>
			</select>
			% else:
			<select id="stevilo_oglasov" class="form-control" name="razvrscanje" style="width:130px;" onchange="javascript:location.href = this.value;">
					<option value="http://localhost:8080/oglasi/{{razvrstitev}}/5/1">5 oglasov</option>
					<option value="http://localhost:8080/oglasi/{{razvrstitev}}/10/1">10 oglasov</option>
					<option selected value="http://localhost:8080/oglasi/{{razvrstitev}}/vsi/1">Vse oglase</option>
			</select>
			% end
			</td>
		  </tr>
		</table>
		</center>
		
		
		
		<form class="form-signin" role="form" method="post" action=".">
		
		<br>
		<center>
		%for (cas,id_oglasa,slika,pasma,cena,regija,st_samick,st_samckov) in oglasi:
			<a href="/oglas/{{id_oglasa}}" style="display:block;width:900px; height:300px" target="_blank" align="center">
				<div id="wrap">
					<div id="left_col">
						<img style="height:280px;max-width:400px;width: expression(this.width > 400 ? 400: true);" src="{{slika}}">
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
		
		<br>
		

		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
			%if stran == 1:
			<li class="page-item"><a class="page-link" href="{{stran}}" style="display:initial;background-color:transparent;border:0">&laquo;</a></li>
			%end
			%if stran != 1:
			<li class="page-item"><a class="page-link" href="{{stran-1}}" style="display:initial;background-color:transparent;border:0">&laquo;</a></li>
			%end
			%for stevilo in range(1,st_strani+1):
				<li class="page-item"><a class="page-link" href="{{stevilo}}" style="display:initial;background-color:transparent;border:0">{{stevilo}}</a></li>
			%end
			%if stran == st_strani:
			<li class="page-item"><a class="page-link" href="{{stran}}" style="display:initial;background-color:transparent;border:0">&raquo;</a></li>
			%end
			%if stran != st_strani:
			<li class="page-item"><a class="page-link" href="{{stran+1}}" style="display:initial;background-color:transparent;border:0">&raquo;</a></li>
			%end
		  </ul>
		</nav>
		
		<br>
		<br>
	</tbody>
	

    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  </body>
</html>