<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Realizar aluguel de carro</title>

    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/footer.css">
</head>
<body>

    <header>
    	<a href="cadastrar_aluguel_de_carro">cadastrar_aluguel_de_carro</a> |
    	<a href="cadastrar_carro">cadastrar_carro</a> | 
    	<a href="cadastrar_categoria">cadastrar_categoria</a> |
    	<a href="cadastrar_locatario">cadastrar_locatario</a> |
    	<a href="cadastrar_reparo">cadastrar_reparo</a> |
    	<a href="index">index</a>
    </header>

    <main>

        <form action="cadastrar_aluguel_de_carro" method="post">

            <h1>Realizar Aluguel</h1>

            <input type="hidden" name="id" value="${aluguelDeCarro.id}">

            <table>
                <tr>
                    <td><Label for="carro_placa">Placa do Carro:</Label></td>

                    <td><input type="text" maxlength="8" id="carro_placa" name="carro_placa" value='<c:out value="${aluguelDeCarro.carro.placa}"/>'></td>

                    <td><button type="submit" name="botao" value="PesquisarCarroPlaca">Pesquisar</button></td> <!--PesquisarCarroPlaca-->
                </tr>

                <tr>
                    <td><Label for="locatario_cpf">CPF do locatario:</Label></td>

                    <td><input type="text" maxlength="11" id="locatario_cpf" name="locatario_cpf" value='<c:out value="${aluguelDeCarro.locatario.cpf}"/>'></td>
                </tr>

                <tr>
                    <td><Label for="data_retirada">Dia de retirada:</Label></td>

                    <td><input type="date" id="data_retirada" name="data_retirada" value='<c:out value="${aluguelDeCarro.dataRetirada}"/>'></td>
                </tr>

                <tr>
                    <td><Label for="data_devolucao">Dia de devolução:</Label></td>

                    <td><input type="date" id="data_devolucao" name="data_devolucao" value='<c:out value="${aluguelDeCarro.dataDevolucao}"/>'></td>
                </tr>

                <tr>
                    <td><button type="submit" name="botao" value="Adicionar">Adicionar
                    <img src="" alt="icone">
                    </button></td>  <!-- Adicionar -->
                    
                    <td><button type="submit" name="botao" value="Listar">Listar
                    <img src="" alt="icone">
                    </button></td>  <!-- Listar -->

                </tr>
            </table>
        </form>

        <hr>

        <section>
            <c:if test="${not empty carros}">
                <table class="tabela_de_pesquisa_carro">
                    <c:forEach var="carro" items="${carros}">
                        <tr class="cabecalho_carro">
                            <td colspan="6"><strong>Carro &#x1F697: ${carro.placa}</strong></td>
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

                            <td colspan="4">
                                <a class="a_link_clicavel" href="${pageContext.request.contextPath }/cadastrar_aluguel_de_carro?acao=selecionar&id=${carro.placa}">Selecionar</a>
                            </td> <!-- selecionar -->
                        </tr>
                        <tr><td colspan="6"><hr></td></tr>
                    </c:forEach>
                </table>
            </c:if>
        </section>

        <section>
            <c:if test="${not empty aluguelDeCarros}">
                <table>
                    <thead>
                        <th>ID:</th>
                        <th>Placa do Carro Alugado:</th>
                        <th>CPF do Locatario:</th>
                        <th>Dia da Retirada:</th>
                        <th>Dia da Devolução:</th>
                        <th>Dias Alugados:</th>
                    </thead>
                    <tbody>
                        <c:forEach var="aluguelDeCarros" items="${aluguelDeCarros}">
                            <tr>
                                <td>${aluguelDeCarros.id}</td>
                                <td>${aluguelDeCarros.carro.placa}</td>
                                <td>${aluguelDeCarros.locatario.cpf}</td>
                                <td>${aluguelDeCarros.dataRetirada}</td>
                                <td>${aluguelDeCarros.dataDevolucao}</td>
                                <td>${aluguelDeCarros.quantDiasAlugado}</td>
                                <td colspan="2">
                                    <a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_aluguel_de_carro?acao=editar&id=${aluguelDeCarros.id}">Editar</a>
                                    <a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_aluguel_de_carro?acao=excluir&id=${aluguelDeCarros.id}">Deletar</a>
                                </td> <!-- editar | excluir -->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </section>

        <aside>
			<c:if test="${not empty saida}">
				<h2 class="h2_mensagem_VALIDACAO">
					<c:out value="${saida}"/>
				</h2>
			</c:if>

			<c:if test="${not empty erro}">
				<h2 class="h2_mensagem_ERRO">
					<c:out value="${erro}"/>
				</h2>
			</c:if>
		</aside>

    </main>

    <footer>
        <p>Desenvolvido por <a href="https://github.com/AnGeloMuniZZZ" target="_blank">Angelo</a> & <a href="https://github.com/FabioAS7" target="_blank">Fábio</a></p>
        <p>|</p>
        <p> <a href="${pageContext.request.contextPath}/politicadeprivacidade.html" target="_blank">Política de Privacidade</a></p>
        <p>|</p>
        <p><a href="${pageContext.request.contextPath}/termosecondicoes.html">Termos e Condições</a></p>
        <p>|</p>
        <p><a href="${pageContext.request.contextPath}/maven-site/index.html" target="_blank">Sobre este site (MavenSite<img src="./assets/maven.ico" alt="Maven_icone">)</a></p>
    </footer>
    
</body>
</html>