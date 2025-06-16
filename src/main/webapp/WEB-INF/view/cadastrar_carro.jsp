<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cadastro de Carros</title>
<link rel="shortcut icon" href="./assets/favicon.ico"
	type="image/x-icon">

<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet" href="./css/filtro.css">
<script src="./js/filtro.js"></script>
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

	<main>

		<form action="cadastrar_carro" method="post">
			<h1>Controle de Carros</h1>

			<table class="superfiltro">
				<tr>
					<td><label for="filtro">Filtrar por:</label></td>
					<td><select name="filtro" id="filtro" onchange="filtros()">
							<option selected disabled>Filtros</option>
							<option value="Marca">Marca</option>
							<option value="Modelo">Modelo</option>
							<option value="Cor">Cor</option>
							<option value="Ano">Ano</option>
							<option value="TipoCombustivel">Tipo de Combustivel</option>
							<option value="TipoCambio">Tipo de Cambio</option>
							<option value="Status">Status do carro</option>
							<option value="cat">Categoria</option>
					</select></td>

					<td><select class="oculta" id="filtroCombustivel"
						name="filtroTexto1">
							<option selected disabled>Selecione o combustível</option>
							<option value="Gasolina">Gasolina</option>
							<option value="Etanol">Etanol</option>
							<option value="Diesel">Diesel</option>
							<option value="GNV">GNV (Gás Natural Veicular)</option>
							<option value="Híbrido">Híbrido</option>
							<option value="Flex">Flex</option>
							<option value="Hidrogênio">Hidrogênio</option>
					</select></td>

					<td><select class="oculta" id="filtroCambio"
						name="filtroTexto2">
							<option selected disabled>Selecione o cambio</option>
							<option value="Manual">Manual</option>
							<option value="Automatizado (embreagem simples)">Automatizado
								(embreagem simples)</option>
							<option value="Automatizado (embreagem dupla)">Automatizado
								(embreagem dupla)</option>
							<option value="Automatico (hidraulico)">Automatico
								(hidraulico)</option>
							<option value="CVT">CVT</option>
							<option value="Sequencial">Sequencial</option>
							<option value="Eletrico (sem cambio convencional)">Eletrico
								(sem cambio convencional)</option>
					</select></td>

					<td><select class="oculta" id="filtroStatus"
						name="filtroTexto3">
							<option selected disabled>Selecione o status</option>
							<option value="Disponivel">Disponível</option>
							<option value="Alugado">Alugado</option>
							<option value="Em Reparo">Em Reparo</option>
							<option value="Inativo">Inativo</option>
					</select></td>

					<td><select class="oculta" name="filtroTextoCat"
						id="filtroCat">
							<option value="" selected disabled>Selecione a categoria</option>
							<c:forEach var="cate" items="${categorias}">
								<option value="${cate.id}"
									<c:if test="${carro.categoria.id == cate.id}">selected</c:if>>${cate.nome}
								</option>
							</c:forEach>
					</select></td>

					<td><input type="text" class="oculta" id="filtroTexto" name="filtroTexto" placeholder="Digite aqui o filtro"></td>
					<td><button type="submit" name="botao" value="Filtrar">
							Filtrar <img src="./assets/filtro.ico" alt="icone">
						</button></td>

				</tr>
			</table>
			<table class="tabela_de_entrada_de_dados">
				<tr>
					<td><Label for="placa">Placa do Carro:</Label></td>

					<td><input type="text" maxlength="8" id="placa" name="placa"
						value='<c:out value="${carro.placa}"/>'></td>

					<td><button type="submit" name="botao" value="PesquisarPlaca">Pesquisar</button></td>
					<!-- PesquisarPlaca -->
				</tr>

				<tr>
					<td><Label for="marca">Marca:</Label></td>
					<td><input type="text" id="marca" name="marca"
						value='<c:out value="${carro.marca}"/>'></td>
				</tr>

				<tr>
					<td><Label for="modelo">Modelo:</Label></td>
					<td><input type="text" id="modelo" name="modelo"
						value='<c:out value="${carro.modelo}"/>'></td>
				</tr>

				<tr>
					<td><Label for="cor">Cor:</Label></td>
					<td><input type="text" id="cor" name="cor"
						value='<c:out value="${carro.cor}"/>'></td>
				</tr>

				<tr>
					<td><Label for="ano">Ano:</Label></td>
					<td><input type="number" id="ano" name="ano" min="1500" max="2030"
						value='<c:out value="${carro.ano}"/>'></td>
				</tr>

				<tr>
					<td><Label for="tipo_combustivel">Tipo de Combustivel:</Label></td>
					<td><select name="tipo_combustivel" id="tipo_combustivel">
							<option value="" disabled
								<c:if test="${empty carro.tipoCombustivel}">selected</c:if>>Selecione
								o combustível</option>
							<option value="Gasolina"
								<c:if test="${carro.tipoCombustivel == 'Gasolina'}">selected</c:if>>Gasolina</option>
							<option value="Etanol"
								<c:if test="${carro.tipoCombustivel == 'Etanol'}">selected</c:if>>Etanol</option>
							<option value="Diesel"
								<c:if test="${carro.tipoCombustivel == 'Diesel'}">selected</c:if>>Diesel</option>
							<option value="GNV"
								<c:if test="${carro.tipoCombustivel == 'GNV'}">selected</c:if>>GNV
								(Gás Natural Veicular)</option>
							<option value="Híbrido"
								<c:if test="${carro.tipoCombustivel == 'Híbrido'}">selected</c:if>>Híbrido</option>
							<option value="Flex"
								<c:if test="${carro.tipoCombustivel == 'Flex'}">selected</c:if>>Flex</option>
							<option value="Hidrogênio"
								<c:if test="${carro.tipoCombustivel == 'Hidrogênio'}">selected</c:if>>Hidrogênio</option>
					</select></td>
				</tr>

				<tr>
					<td><Label for="litros_combustivel">Litros
							Combustivel:</Label></td>
					<td><input type="number" id="litros_combustivel"
						name="litros_combustivel" min="0" max="999.99" step="0.01"
						value='<c:out value="${carro.litrosCombustivel}"/>'></td>
				</tr>

				<tr>
					<td><Label for="km_rodados">Quilometragem Rodados:</Label></td>
					<td><input type="number" id="km_rodados" name="km_rodados"
						min="0" max="999999999.9" step="0.1"
						value='<c:out value="${carro.kmRodados}"/>'></td>
				</tr>

				<tr>
					<td><Label for="tipo_cambio">Tipo de Câmbio:</Label></td>
					<td><select name="tipo_cambio" id="tipo_cambio">
							<option value="" disabled
								<c:if test="${empty carro.tipoCambio}">selected</c:if>>Selecione
								o câmbio</option>
							<option value="Manual"
								<c:if test="${carro.tipoCambio == 'Manual'}">selected</c:if>>Manual</option>
							<option value="Automatizado (embreagem simples)"
								<c:if test="${carro.tipoCambio == 'Automatizado (embreagem simples)'}">selected</c:if>>Automatizado
								(embreagem simples)</option>
							<option value="Automatizado (embreagem dupla)"
								<c:if test="${carro.tipoCambio == 'Automatizado (embreagem dupla)'}">selected</c:if>>Automatizado
								(embreagem dupla)</option>
							<option value="Automatico (hidraulico)"
								<c:if test="${carro.tipoCambio == 'Automatico (hidraulico)'}">selected</c:if>>Automático
								(hidráulico)</option>
							<option value="CVT"
								<c:if test="${carro.tipoCambio == 'CVT'}">selected</c:if>>CVT</option>
							<option value="Sequencial"
								<c:if test="${carro.tipoCambio == 'Sequencial'}">selected</c:if>>Sequencial</option>
							<option value="Eletrico (sem cambio convencional)"
								<c:if test="${carro.tipoCambio == 'Eletrico (sem cambio convencional)'}">selected</c:if>>Elétrico
								(sem câmbio convencional)</option>
					</select></td>
				</tr>

				<tr>
					<td><label for="status_disponivel">Status do carro:</label></td>
					<td><input type="radio" id="status_disponivel"
						name="status_carro" value="Disponivel"
						<c:if test="${carro.statusCarro == 'Disponivel'}">checked</c:if>>
						<label for="status_disponivel">Disponível</label> <input
						type="radio" id="status_alugado" name="status_carro"
						value="Alugado"
						<c:if test="${carro.statusCarro == 'Alugado'}">checked</c:if>>
						<label for="status_alugado">Alugado</label> <input type="radio"
						id="status_reparo" name="status_carro" value="Em Reparo"
						<c:if test="${carro.statusCarro == 'Em Reparo'}">checked</c:if>>
						<label for="status_reparo">Em Reparo</label></td>
				</tr>

				<tr>
					<td><Label for="categoria_id">Categoria:</Label></td>

					<td><select name="categoria_id" id="categoria_id">
							<option value="" selected disabled>Selecione a categoria</option>
							<c:forEach var="cate" items="${categorias}">
								<option value="${cate.id}"
									<c:if test="${carro.categoria.id == cate.id}">selected</c:if>>${cate.nome}
								</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td><button type="submit" name="botao" value="Adicionar">
							Adicionar <img src="./assets/adicionar.ico" alt="icone">
						</button></td>
					<!-- Adicionar -->

					<td><button type="submit" name="botao" value="Listar">
							Listar <img src="./assets/listar.ico" alt="icone">
						</button></td>
					<!-- Listar -->

					<td><button type="submit" name="botao" value="Remover">
							Remover <img src="./assets/remover.ico" alt="icone">
						</button></td>
					<!-- Remover -->
				</tr>

			</table>
		</form>

		<hr>

		<section>
			<c:if test="${not empty carros}">
				<table class="tabela_de_pesquisa_carro">
					<c:forEach var="carro" items="${carros}">
						<tr class="cabecalho_carro">
							<td colspan="6"><strong>Carro &#x1F697:
									${carro.placa}</strong></td>
						</tr>

						<tr>
							<th scope="row"><label>Marca:</label></th>
							<td>${carro.marca}</td>

							<th scope="row"><label>Modelo:</label></th>
							<td>${carro.modelo}</td>

							<th scope="row"><label>Cor:</label></th>
							<td>${carro.cor}</td>
						</tr>

						<tr>
							<th scope="row"><label>Ano:</label></th>
							<td>${carro.ano}</td>

							<th scope="row"><label>Combustível:</label></th>
							<td>${carro.tipoCombustivel}</td>

							<th scope="row"><label>Litros no tanque:</label></th>
							<td>${carro.litrosCombustivel}</td>
						</tr>

						<tr>
							<th scope="row"><label>km Rodados:</label></th>
							<td>${carro.kmRodados}</td>

							<th scope="row"><label>Câmbio:</label></th>
							<td>${carro.tipoCambio}</td>

							<th scope="row"><label>Status:</label></th>
							<td>${carro.statusCarro}</td>
						</tr>

						<tr>
							<th scope="row"><label>Categoria:</label></th>
							<td>${carro.categoria.nome}</td>

							<td colspan="4"><a class="a_link_clicavel"
								href="${pageContext.request.contextPath }/cadastrar_carro?acao=editar&id=${carro.placa}">Editar</a>
								| <a class="a_link_clicavel"
								href="${pageContext.request.contextPath }/cadastrar_carro?acao=excluir&id=${carro.placa}">Deletar</a>
							</td>
							<!-- editar | excluir -->
						</tr>
						<tr>
							<td colspan="6"><hr></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</section>

		<aside>
			<c:if test="${not empty saida}">
				<h2 class="h2_mensagem_VALIDACAO">
					<c:out value="${saida}" />
				</h2>
			</c:if>

			<c:if test="${not empty erro}">
				<h2 class="h2_mensagem_ERRO">
					<c:out value="${erro}" />
				</h2>
			</c:if>
		</aside>

	</main>

	<footer>
		<p>
			Desenvolvido por <a href="https://github.com/AnGeloMuniZZZ"
				target="_blank">Angelo</a> & <a href="https://github.com/FabioAS7"
				target="_blank">Fábio</a>
		</p>
		<p>|</p>
		<p>
			<a
				href="${pageContext.request.contextPath}/politicadeprivacidade.html"
				target="_blank">Política de Privacidade</a>
		</p>
		<p>|</p>
		<p>
			<a href="${pageContext.request.contextPath}/termosecondicoes.html">Termos
				e Condições</a>
		</p>
		<p>|</p>
		<p>
			<a href="${pageContext.request.contextPath}/maven-site/index.html"
				target="_blank">Sobre este site (MavenSite<img
				src="./assets/maven.ico" alt="Maven_icone">)
			</a>
		</p>
	</footer>

</body>
</html>