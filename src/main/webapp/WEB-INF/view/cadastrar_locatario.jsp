<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cadastar locatario</title>
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

		<form action="cadastrar_locatario" method="post">
			<h1>Cadastro de locatario</h1>

			<table>
				<tr>
					<td><Label for="cpf">CPF do locatario:</Label></td>
					<td><input type="text" id="cpf" name="cpf" maxlength="11"
						value='<c:out value="${locatario.cpf}"/>'></td>
				</tr>

				<tr>
					<td><Label for="nome">Nome do locatario:</Label></td>
					<td><input type="text" id="nome" name="nome" maxlength="90"
						value='<c:out value="${locatario.nome}"/>'></td>
				</tr>

				<tr>
					<td><Label for="num_habilitacao">Núm. Habilitacao do
							locatario:</Label></td>
					<td><input type="text" id="num_habilitacao"
						name="num_habilitacao" maxlength="11"
						value='<c:out value="${locatario.numHabilitacao}"/>'></td>
				</tr>

				<tr>
					<td><Label for="data_nascimento">Data de nascimento do
							locatario:</Label></td>
					<td><input type="date" id="data_nascimento"
						name="data_nascimento"
						value='<c:out value="${locatario.dataNascimento}"/>'></td>
				</tr>
			</table>

			<hr>

			<table>
				<input type="hidden" name="idE" value="${endereco.id}">
				<tr>
					<td><Label for="logradouro_endereco">Endereço
							locatario:</Label></td>
					<td><input type="text" id="logradouro_endereco"
						name="logradouro_endereco" maxlength="100"
						value='<c:out value="${endereco.lougradouroEndereco}"/>'></td>
				</tr>

				<tr>
					<td><Label for="logradouro_num">Número do Endereço:</Label></td>
					<td><input type="text" id="logradouro_num"
						name="logradouro_num" maxlength="4"
						value='<c:out value="${endereco.lougradouroNum}"/>'></td>
				</tr>

				<tr>
					<td><Label for="logradouro_cep">CEP:</Label></td>
					<td><input type="text" id="logradouro_cep"
						name="logradouro_cep" maxlength="8" placeholder="00000-000"
						value='<c:out value="${endereco.lougradouroCep}"/>'></td>
				</tr>

				<tr>
					<td><Label for="logradouro_cidade">Cidade:</Label></td>
					<td><input type="text" id="logradouro_cidade"
						name="logradouro_cidade" maxlength="100"
						value='<c:out value="${endereco.lougradouroCidade}"/>'></td>
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
		<form action="cadastrar_locatario_relatorio" method="post" target="_blank">
			<table>
				<tr>
				<td colspan="1"><label for="relatorio">CPF: </label></td>
				<td colspan="2"><input type="text" id="relatorio" name="cpf"></td>
					<td colspan="1"><input type="submit" name="botao" value="relatorio">
					</td>
				</tr>
			</table>
		</form>

		<section>
			<c:if test="${not empty locatarios}">
				<table class="tabela_de_apesentacao">
					<thead>
						<tr>
							<th>CPF:</th>
							<th>Nome:</th>
							<th>Núm. Habilitacao</th>
							<th>Data de nascimento:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="locatarios" items="${locatarios}">
							<tr>
								<td>${locatarios.cpf}</td>
								<td>${locatarios.nome}</td>
								<td>${locatarios.numHabilitacao}</td>
								<td>${locatarios.dataNascimento}</td>
								<td colspan="2"><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_locatario?acao=editar&id=${locatarios.cpf}">Editar</a>
									<a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_locatario?acao=excluir&id=${locatarios.cpf}">Deletar</a>
								</td>
						</c:forEach>
					</tbody>
				</table>
			</c:if>



			<c:if test="${not empty enderecos}">
				<table class="tabela_de_apesentacao">
					<thead>
						<th>ID:</th>
						<th>Endereço:</th>
						<th>Núm:</th>
						<th>CEP:</th>
						<th>Cidade:</th>
					</thead>
					<tbody>
						<c:forEach var="enderecos" items="${enderecos}">
							<tr>
								<td>${enderecos.id}</td>
								<td>${enderecos.lougradouroEndereco}</td>
								<td>${enderecos.lougradouroNum}</td>
								<td>${enderecos.lougradouroCep}</td>
								<td>${enderecos.lougradouroCidade}</td>
								<td colspan="2"><a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_locatario?acao=editar&idE=${enderecos.id}">Editar</a>
									<a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_locatario?acao=excluir&idE=${enderecos.id}">Deletar</a>
								</td>
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