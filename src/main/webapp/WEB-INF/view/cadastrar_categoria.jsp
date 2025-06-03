<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Categoria</title>
    
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
        <form action="cadastrar_categoria" method="post">
            <h1>Cadastro de Categoria</h1>

            <input type="hidden" name="id" value="${categoria.id}">

            <table>
                <tr>
                    <td><Label for="nome">Nome da categoria:</Label></td>
                    <td><input type="text" id="nome" name="nome" required></td>
                    <td><button type="submit" name="botao" value="Pesquisar">Pesquisar</button></td>
                </tr>

                <tr>
                    <td><Label for="valor_diaria">Valor da diaria:</Label></td>
                    <td><input type="number" min="0" max="99999.99" step="0.01" id="valor_diaria" name="valor_diaria" required></td>
                </tr>

            </table>

        </form>
    </main>

    <footer></footer>
    
</body>
</html>