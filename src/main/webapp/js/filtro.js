function filtros(){
	const filtro1 = document.getElementById("filtro");
	const comb = document.getElementById("filtroCombustivel");
	const camb = document.getElementById("filtroCambio");
	const status = document.getElementById("filtroStatus");
	const txt = document.getElementById("filtroTexto");
	const cate = document.getElementById("filtroCat");

	if(filtro1.value === "TipoCombustivel"){
		comb.style.display = "block";
		txt.style.display = "none";
		camb.style.display = "none";
		status.style.display = "none";
		cate.style.display = "none";
	} else if(filtro1.value === "TipoCambio"){
		camb.style.display = "block";
		status.style.display = "none";
		cate.style.display = "none";
		comb.style.display = "none";
		txt.style.display = "none";
	} else if(filtro1.value === "Status"){
		status.style.display = "block";
		comb.style.display = "none";
		camb.style.display = "none";
		cate.style.display = "none";
		txt.style.display = "none";
	} else if(filtro1.value === "cat"){
		cate.style.display = "block";
		comb.style.display = "none";
		camb.style.display = "none";
		status.style.display = "none";
		txt.style.display = "none";
	} else {
		txt.style.display = "block";
		comb.style.display = "none";
		camb.style.display = "none";
		status.style.display = "none";
		cate.style.display = "none";
	}

}