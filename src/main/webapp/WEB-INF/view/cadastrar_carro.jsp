<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Carros</title>

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

        <form action="cadastrar_carro" method="post">
            <h1>Cadastro de Carros</h1>
            <table class="tabela_de_entrada_de_dados">
                <tr>
                    <td><Label for="placa">Placa do Carro:</Label></td>
                    <td><input type="text" id="placa" name="placa" required></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="marca">Marca:</Label></td>
                    <td><input type="text" id="marca" name="marca" required></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="modelo">Modelo:</Label></td>
                    <td><input type="text" id="modelo" name="modelo" required></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="cor">Cor:</Label></td>
                    <td><input type="text" id="cor" name="cor" required></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="ano">Ano:</Label></td>
                    <td><input type="number" id="ano" name="ano" min="1900" max="2099" step="1" required></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="tipo_combustivel">Tipo de Combustivel:</Label></td>
                    <td>
                        <select name="tipo_combustivel" id="tipo_combustivel" required>
                             <option value="" selected disabled>Selecione o combustível</option>
                            <option value="Gasolina">Gasolina</option>
                            <option value="Etanol">Etanol</option>
                            <option value="Diesel">Diesel</option>
                            <option value="GNV">GNV (Gás Natural Veicular)</option>
                            <option value="Híbrido">Híbrido</option>
                            <option value="Flex">Flex</option>
                            <option value="Hidrogênio">Hidrogênio </option>
                        </select>
                    </td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="litros_combustivel">Litros Combustivel:</Label></td>
                    <td><input type="number" id="litros_combustivel" name="litros_combustivel" min="0" max="999.99" step="0.01" required></td>
                </tr>

                <tr>
                    <td><Label for="km_rodados">Quilometragem Rodados:</Label></td>
                    <td><input type="number" id="km_rodados" name="km_rodados" min="0" max="999999999.9" step="0.1" required></td>
                </tr>

                <tr>
                    <td><Label for="tipo_cambio">Tipo de Câmbio:</Label></td>
                    <td>
                        <select name="tipo_cambio" id="tipo_cambio" required>
                             <option value="" selected disabled>Selecione o câmbio</option>
                             <option value="Manual">Manual</option>
                             <option value="Automatizado (embreagem simples)">Automatizado (embreagem simples)</option>
                             <option value="Automatizado (embreagem dupla)">Automatizado (embreagem dupla)</option>
                             <option value="Automático (hidráulico)">Automático (hidráulico)</option>
                             <option value="CVT">CVT</option>
                             <option value="Sequencial">Sequencial</option>
                             <option value="Elétrico (sem câmbio convencional)">Elétrico (sem câmbio convencional)</option>
                        </select>
                    </td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>
                
                <tr>
                    <td><label for="status_disponivel">Status do carro:</label></td>
                    <td>
                        <input type="radio" id="status_disponivel" name="status_carro" value="Disponível" required>
                        <label for="status_disponivel">Disponível</label>

                        <input type="radio" id="status_alugado" name="status_carro" value="Alugado" required>
                        <label for="status_alugado">Alugado</label>

                        <input type="radio" id="status_reparo" name="status_carro" value="Em Reparo" required>
                        <label for="status_reparo">Em Reparo</label>

                        <input type="radio" id="status_inativo" name="status_carro" value="Inativo" required>
                        <label for="status_inativo">Inativo / Fora de Frota</label>
                    </td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="categoria_id">Categoria:</Label></td>

                    <td>
                        <select name="categoria_id" id="categoria_id" required>
                            <option value="" selected disabled>Selecione a categoria</option>
                            <c:forEach var="c" items="${categoria}">
							    <option value="${c.id}"
								    <c:if test="${true}">selected <!--ARRUMAR AQUI O-->
                                    </c:if>
                                    >${c.nome}
                                </option>
						    </c:forEach>
                        </select>
                    </td>

                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
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
                                <a class="a_link_clicavel" href="${pageContext.request.contextPath }/cadastrar_carro?acao=editar&id=${c.placa}">Editar</a> |
                                <a class="a_link_clicavel" href="${pageContext.request.contextPath }/cadastrar_carro?acao=excluir&id=${c.placa}">Deletar</a>
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