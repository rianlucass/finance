package com.br.finance.service;

public class Teste {
    public static void main(String[] args) {
        Service service = new Service();

        service.setSaidasMes(123);
        service.setSaidasMes(43);
        service.setSaidasMes(43);

        System.out.println(service.getEntradaMes());
    }
}
