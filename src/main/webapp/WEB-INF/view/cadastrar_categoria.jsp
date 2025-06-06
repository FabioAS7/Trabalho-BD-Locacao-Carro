<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Categoria</title>

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

        <form action="cadastrar_categoria" method="post">
            <h1>Cadastro de Categoria</h1>

            <input type="hidden" name="id" value="${categoria.id}">

            <table>
                <tr>
                    <td><Label for="nome">Nome da categoria:</Label></td>

                    <td><input type="text" id="nome" name="nome" maxlength="80" value='<c:out value="${categoria.nome}"/>'></td>

                </tr>

                <tr>
                    <td><Label for="valor_diaria">Valor da diaria:</Label></td>

                    <td><input type="number" min="0" max="99999.99" step="0.01" id="valor_diaria" name="valor_diaria" value='<c:out value="${categoria.valorDiaria}"/>'></td>
                </tr>

                <tr>
                    <td><button type="submit" name="botao" value="Adicionar">Adicionar
                    <img src="" alt="icone">
                    </button></td>  <!-- Adicionar -->
                    
                    <td><button type="submit" name="botao" value="Listar">Listar
                    <img src="" alt="icone">
                    </button></td>  <!-- Listar -->

                    <td><button type="submit" name="botao" value="Remover">Remover
                    <img src="" alt="icone">
                    </button></td>  <!-- Remover -->
                </tr>

            </table>
        </form>

        <hr>

        <section>
            <c:if test="${not empty categorias}">
                <table>
                    <thead>
                        <tr>
                            <th>ID:</th>
                            <th>Nome:</th>
                            <th>Valor da diaria:</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="categorias" items="${categorias}">
                            <tr>
                                <td>${categorias.id}</td>
                                <td>${categorias.nome}</td>
                                <td>${categorias.valorDiaria}</td>
								<td colspan="2">
                                    <a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_categoria?acao=editar&id=${categorias.id}">Editar</a>
                                    <a class="a_link_clicavel"
									href="${pageContext.request.contextPath }/cadastrar_categoria?acao=excluir&id=${categorias.id}">Deletar</a>
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
        <p><a href="${pageContext.request.contextPath}/maven-site/index.html" target="_blank">Sobre este site (MavenSite<img src="../../assets/maven.ico" alt="Maven_icone">)</a></p>
    </footer>
    
</body>
</html>