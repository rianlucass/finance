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
        <h1>Finance</h1>
    </header>

    <!-- Boas-vindas -->
    <main>
        <h2>Bem-vindo, <span>+nome</span></h2>

        <!-- Resumo Financeiro -->
        <section class="resumo-financeiro">
            <div class="card saldo-atual">
                <p>Saldo Atual</p>
                <span>R$ 0</span>
            </div>
            <div class="card saidas">
                <p>Saídas no mês</p>
                <span>R$ 0</span>
            </div>
            <div class="card entradas">
                <p>Entradas no mês</p>
                <span>R$ 0</span>
            </div>
        </section>

        <!-- Detalhamento -->
        <section class="detalhamento">
            <h3>Detalhamento do Mês - Tabela</h3>
            <div class="detalhamento-tabela">
                <!-- Conteúdo da tabela será adicionado depois -->
            </div>
        </section>

        <!-- Botões -->
        <div class="botoes">
            <button class="saida" onclick="abrirPopup('saida')">Adicionar saída</button>
            <button class="entrada" onclick="abrirPopup('entrada')">Adicionar entrada</button>
        </div>

        <!-- Gráfico (simulado) -->
        <section class="grafico">
            <div class="grafico-pizza"></div>
        </section>
    </main>

    <!-- Popup -->
    <div id="popup-overlay" class="popup-overlay">
        <div id="popup">
            <h3 id="popup-titulo"></h3>
            <form>
                <label for="descricao">Descrição:</label>
                <input type="text" id="descricao" placeholder="Ex: Compra de supermercado" required>

                <label for="valor">Valor (R$):</label>
                <input type="number" id="valor" step="0.01" placeholder="Ex: 50.00" required>

                <button type="button" onclick="fecharPopup()">Cancelar</button>
                <button type="submit">Salvar</button>
            </form>
        </div>
    </div>


    <script>
        function abrirPopup(tipo) {
            const popupTitulo = document.getElementById('popup-titulo');
            popupTitulo.textContent = tipo === 'saida' ? 'Adicionar Saída' : 'Adicionar Entrada';
            document.getElementById('popup-overlay').classList.add('active');
        }

        function fecharPopup() {
            document.getElementById('popup-overlay').classList.remove('active');
        }
    </script>
</body>
</html>
