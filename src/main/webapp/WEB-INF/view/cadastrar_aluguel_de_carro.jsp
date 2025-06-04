<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Realizar aluguel de carro</title>

    <link rel="stylesheet" href="./css/main.css">
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

            <input type="hidden" name="id" value="${aluguel_de_carro.id}">

            <table>
                <tr>
                    <td><Label for="carro_placa">Placa do Carro:</Label></td>
                    <td><input type="text" id="carro_placa" name="carro_placa" ></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="locatario_cpf">CPF do locatario:</Label></td>
                </tr>

                <tr>
                    <td><Label for="data_retirada">Dia de retirada:</Label></td>
                    <td><input type="date" id="data_retirada" name="data_retirada" ></td>
                </tr>

                <tr>
                    <td><Label for="data_devolucao">Dia de devolução:</Label></td>
                    <td><input type="date" id="data_devolucao" name="data_devolucao" ></td>
                </tr>
            </table>
        </form>

        <hr>

        <section>
            <c:if test="${not empty carros}">
                <table class="tabela_de_pesquisa_carro">
                    <c:forEach var="c" items="${carros}">
                        <tr class="cabecalho_carro">
                            <td colspan="6"><strong>Carro &#x1F697: ${c.placa}</strong></td>
                        </tr>

                        <tr>
                            <td><label>Marca:</label></td>
                            <td>${c.marca}</td>

                            <td><label>Modelo:</label></td>
                            <td>${c.modelo}</td>
                            
                            <td><label>Cor:</label></td>
                            <td>${c.cor}</td>
                        </tr>

                        <tr>
                            <td><label>Ano:</label></td>
                            <td>${c.ano}</td>

                            <td><label>Combustível:</label></td>
                            <td>${c.tipo_combustivel}</td>

                            <td><label>Litros no tanque:</label></td>
                            <td>${c.litros_combustivel}</td>
                        </tr>

                        <tr>
                            <td><label>KM Rodados:</label></td>
                            <td>${c.km_rodados}</td>

                            <td><label>Câmbio:</label></td>
                            <td>${c.tipo_cambio}</td>

                            <td><label>Status:</label></td>
                            <td>${c.status_carro}</td>
                        </tr>

                        <tr>
                            <td><label>Categoria:</label></td>
                            <td>${c.categoria_id}</td>

                            <td colspan="4">
                                <a class="a_link_clicavel" href="${pageContext.request.contextPath }/cadastrar_carro?acao=selecionar&id=${c.placa}">Selecionar carro</a>
                            </td>
                        </tr>
                        <tr><td colspan="6"><hr></td></tr>
                    </c:forEach>
                </table>

            </c:if>
        </section>

    </main>

    <footer></footer>
    
</body>
</html>