<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastar locatario</title>

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
        <form action="cadastrar_locatario" method="post">
            <h1>Cadastro de locatario</h1>

            <table>
                <tr>
                    <td><Label for="cpf">CPF do locatario:</Label></td>
                    <td><input type="text" id="cpf" name="cpf" maxlength="11"></td>
                </tr>

                <tr>
                    <td><Label for="nome">Nome do locatario:</Label></td>
                    <td><input type="text" id="nome" name="nome" maxlength="90"></td>
                </tr>

                <tr>
                    <td><Label for="num_habilitacao">Núm. Habilitacao do locatario:</Label></td>
                    <td><input type="text" id="num_habilitacao" name="num_habilitacao" maxlength="11"></td>
                </tr>

                <tr>
                    <td><Label for="data_nascimento">Data de nascimento do locatario:</Label></td>
                    <td><input type="date" id="data_nascimento" name="data_nascimento" ></td>
                </tr>
            <!--------------------------------------------------------->
                <tr>
                    <td><Label for="logradouro_endereco">Endereço locatario:</Label></td>
                    <td><input type="text" id="logradouro_endereco" name="logradouro_endereco" maxlength="100" ></td>
                </tr>

                <tr>
                    <td><Label for="logradouro_num">Número do Endereço:</Label></td>
                    <td><input type="text" id="logradouro_num" name="logradouro_num" maxlength="10" ></td>
                </tr>

                <tr>
                    <td><Label for="logradouro_cep">CEP:</Label></td>
                    <td><input type="text" id="logradouro_cep" name="logradouro_cep" maxlength="8" placeholder="00000-000" ></td>
                </tr>

                <tr>
                    <td><Label for="logradouro_cidade">Cidade:</Label></td>
                    <td><input type="text" id="logradouro_cidade" name="logradouro_cidade" maxlength="100" ></td>
                </tr>

            </table>
        </form>

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