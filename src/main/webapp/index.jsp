<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance Pagina Inicial</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Header -->
    <header>
        <h1>Finanças</h1>
    </header>

    <!-- Boas-vindas -->
    <main>
        <h2>Bem-vindo, <span>Rian Lucas</span></h2>

        <!-- Resumo Financeiro -->
        <section class="resumo-financeiro">
            <div class="card saldo-atual">
                <p>Saldo Atual</p>
                <span>R$ <%= request.getAttribute("saldo") != null ? request.getAttribute("saldo") : 0.0 %></span>
            </div>
            <div class="card saidas">
                <p>Saídas no mês</p>
                <span>R$ <%= request.getAttribute("valorSaida") != null ? request.getAttribute("valorSaida") : 0.0 %></span>
            </div>
            <div class="card entradas">
                <p>Entradas no mês</p>
                <span>R$ <%= request.getAttribute("valorEntrada") != null ? request.getAttribute("valorEntrada") : 0.0%></span>
            </div>
        </section>

        <!-- Detalhamento -->
        <section class="detalhamento">
            <h3>Detalhamento do Mês - Tabela</h3>
            <div class="detalhamento-tabela">
                <table class="detalhamento-tabela-conteudo">
                    <thead>
                        <tr>
                            <th>Descrição - </th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%= request.getAttribute("descricao") %></td>
                            <td>R$ <%= request.getAttribute("saldo") != null ? request.getAttribute("saldo") : 0.0 %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>


<form action="financas" method="post">
    <div class="botoes">
        <button class="saida" name="tipo" value="saida" type="button" onclick="abrirPopup('saida')">Adicionar saída</button>
        <button class="entrada" name="tipo" value="entrada" type="button" onclick="abrirPopup('entrada')">Adicionar entrada</button>
    </div>
</form>

<!-- Gráfico (simulado) -->
<section class="grafico">
    <div class="grafico-pizza"></div>
</section>

<!-- Popup -->
<div id="popup-overlay">
    <div id="popup">
        <h3 id="popup-titulo"></h3>
        <form id="form-popup" action="financas" method="post">
            <label for="descricao">Descrição:</label>
            <input type="text" id="descricao" name="descricao" placeholder="Ex: Compra de supermercado" required>

            <label for="valor">Valor (R$):</label>
            <input type="number" id="valor" name="valor" step="0.01" placeholder="Ex: 50.00" required>

            <div class="botoes-popup">
                <button class="cancelar" type="button" onclick="fecharPopup()">Cancelar</button>
                <button class="salvar" type="submit" onclick="adicionarTipo()">Salvar</button>
            </div>
        </form>
    </div>
</div>

<script defer>
    let tipoTransacao = ''; // Variável para armazenar o tipo de transação

    function abrirPopup(tipo) {
        tipoTransacao = tipo; // Armazenar o tipo da transação (saida ou entrada)
        const popupTitulo = document.getElementById('popup-titulo');
        popupTitulo.textContent = tipo === 'saida' ? 'Adicionar Saída' : 'Adicionar Entrada';
        document.getElementById('popup-overlay').classList.add('active');
    }

    function fecharPopup() {
        document.getElementById('popup-overlay').classList.remove('active');
    }

    function adicionarTipo() {
        // Adicionar o tipo de transação (saida ou entrada) ao formulário antes de enviar
        const tipoInput = document.createElement('input');
        tipoInput.setAttribute('type', 'hidden');
        tipoInput.setAttribute('name', 'tipo');
        tipoInput.setAttribute('value', tipoTransacao);

        // Adicionar o campo oculto ao formulário do popup
        document.getElementById('form-popup').appendChild(tipoInput);
    }
</script>
</body>
</html>
