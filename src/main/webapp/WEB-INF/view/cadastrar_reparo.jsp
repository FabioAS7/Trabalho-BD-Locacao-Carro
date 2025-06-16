<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cadastro de Reparo</title>
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

	<main>

		<form action="cadastrar_reparo" method="post">
			<h1>Enviar para Reparo</h1>

			<input type="hidden" name="id" value="${reparo.id}">

			<table>

				<tr>
					<td><Label for="carro_placa">Placa do Carro:</Label></td>
					<td><input type="text" id="carro_placa" name="carro_placa"
						maxlength="8" value='<c:out value="${reparo.carro.placa}"/>'></td>
					<td><button type="submit" name="botao" value="PesquisarPlaca">Listar
							Carros</button></td>
				</tr>

				<tr>
					<td><Label for="dia_entrada">Dia de entrada:</Label></td>
					<td><input type="date" id="dia_entrada" name="dia_entrada"
						value='<c:out value="${reparo.diaEntrada}"/>'></td>
				</tr>

				<tr>
					<td><Label for="quant_dias_reparo">Quant. de dias em
							reparo:</Label></td>
					<td><input type="number" min="0" max="999"
						id="quant_dias_reparo" name="quant_dias_reparo"
						value='<c:out value="${reparo.quantDiasReparo}"/>'></td>
				</tr>

				<tr>
					<td><Label for="descricao_problema">Descrição do
							problema:</Label></td>
					<td><textarea name="descricao_problema"
							id="descricao_problema" maxlength="255"
							placeholder="Descreva o problema do carro em detalhes..."
							rows="5" style="resize: none; width: 100%;"><c:out
								value="${reparo.descricaoProblema}" /></textarea></td>
				</tr>

				<tr>
					<td><Label for="valor_reparo">Valor do reparo:</Label></td>
					<td><input type="number" min="0" max="9999999.99" step="0.01"
						id="valor_reparo" name="valor_reparo"
						value='<c:out value="${reparo.valorReparo}"/>'></td>
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

		<br>
		<form action="cadastrar_reparo_relatorio" method="post" target="_blank">
			<table>
				<tr>
				<td colspan="1"><label for="relatorio">Data: </label></td>
				<td colspan="2"><input type="date" id="relatorio" name="dia"></td>
					<td colspan="1"><input type="submit" name="botao" value="relatorio">
					</td>
				</tr>
			</table>
		</form>
	
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
								href="${pageContext.request.contextPath}/cadastrar_reparo?acao=selecionar&id=${carro.placa}">Selecionar</a>
							</td>
							<!-- selecionar -->
						</tr>
						<tr>
							<td colspan="6"><hr></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</section>

		<section>
			<c:if test="${not empty reparos}">
				<table class="tabela_de_apesentacao">
					<thead>
						<tr>
							<th>ID:</th>
							<th>Dia de entrada:</th>
							<th>Quant. de dias em reparo:</th>
							<th>Descrição do problema:</th>
							<th>Valor do reparo:</th>
							<th>Placa do carro:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reparos" items="${reparos}">
							<tr>
								<td>${reparos.id}</td>
								<td>${reparos.diaEntrada}</td>
								<td>${reparos.quantDiasReparo}</td>
								<td>${reparos.descricaoProblema}</td>
								<td>${reparos.valorReparo}</td>
								<td>${reparos.carro.placa}</td>
								<td colspan="2"><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_reparo?acao=editar&id=${reparos.id}">Editar</a>
									<a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_reparo?acao=excluir&id=${reparos.id}">Deletar</a>
								</td>
								<!-- editar | excluir -->
							</tr>
						</c:forEach>
					</tbody>
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