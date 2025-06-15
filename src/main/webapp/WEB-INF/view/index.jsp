<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="shortcut icon" href="./assets/favicon.ico"
	type="image/x-icon">

<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/footer.css">
</head>
<body>

	<header>
		<span class="logotipo"><a href="index">Aluguel de Carros</a></span>

		<nav>
			<ul class="links_de_navegacao">
				<li><a href="cadastrar_categoria">Adicionar Categoria</a></li>
				<li><a href="cadastrar_carro">Cadastrar Carro</a></li>
				<li><a href="cadastrar_locatario">Cadastrar Locatario</a></li>
				<li><a href="cadastrar_aluguel_de_carro">Realizar Aluguel</a></li>
				<li><a href="cadastrar_reparo">Reparos</a></li>
			</ul>
		</nav>
	</header>

	<h1>INDEX :)</h1>


	<audio preload="metadata" autoplay controls loop style="display: none;">
		<source src="./assets/carro.mp3" type="audio/mpeg">
	</audio>


</body>
</html>