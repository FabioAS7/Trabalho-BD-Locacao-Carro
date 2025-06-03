<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastar locatario</title>
    
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
        <form action="cadastrar_locatario" method="post">
            <h1>Cadastro de locatario</h1>

            <table>
                <tr>
                    <td><Label for="cpf">CPF do locatario:</Label></td>
                    <td><input type="text" id="cpf" name="cpf" required></td>
                </tr>

                <tr>
                    <td><Label for="nome">Nome do locatario:</Label></td>
                    <td><input type="text" id="nome" name="nome" required></td>
                </tr>

                <tr>
                    <td><Label for="num_habilitacao">Núm. Habilitacao do locatario:</Label></td>
                    <td><input type="text" id="num_habilitacao" name="num_habilitacao" required></td>
                </tr>

                <tr>
                    <td><Label for="data_nascimento">Data de nascimento do locatario:</Label></td>
                    <td><input type="date" id="data_nascimento" name="data_nascimento" required></td>
                </tr>
            <!--------------------------------------------------------->
                <tr>
                    <td><Label for="logradouro_endereco">Endereço locatario:</Label></td>
                    <td><input type="text" id="logradouro_endereco" name="logradouro_endereco" maxlength="100" required></td>
                </tr>

                <tr>
                    <td><Label for="logradouro_num">Número do Endereço:</Label></td>
                    <td><input type="text" id="logradouro_num" name="logradouro_num" maxlength="10" required></td>
                </tr>

                <tr>
                    <td><Label for="logradouro_cep">CEP:</Label></td>
                    <td><input type="text" id="logradouro_cep" name="logradouro_cep" maxlength="8" placeholder="00000-000" required></td>
                </tr>

                <tr>
                    <td><Label for="logradouro_cidade">Cidade:</Label></td>
                    <td><input type="text" id="logradouro_cidade" name="logradouro_cidade" maxlength="100" required></td>
                </tr>

            </table>

        </form>
    </main>

    <footer></footer>

</body>
</html>