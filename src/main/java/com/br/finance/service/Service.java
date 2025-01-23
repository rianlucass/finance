package com.br.finance.service;

public class Service {
    private double saldoAtual;
    private double saidaMes;
    private double entradaMes;

    public void setEntradasMes(double entrada) {
        entradaMes += entrada;
    }

    public void setSaidasMes(double saida) {
        saidaMes += saida;
    }

    public void atualizarSaldo() {
        saldoAtual = entradaMes - saidaMes;
    }

    public double getSaldoAtual() {
        return saldoAtual;
    }

    public double getEntradaMes() {
        return entradaMes;
    }

    public double getSaidaMes() {
        return saidaMes;
    }
}
