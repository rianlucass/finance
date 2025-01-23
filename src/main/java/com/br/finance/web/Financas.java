package com.br.finance.web;

import com.br.finance.service.Service;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/financas")
public class Financas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        String descricao = req.getParameter("descricao");
        String valor = req.getParameter("valor");

        System.out.println("Descrição: " + descricao);
        System.out.println("Valor: " + valor);
        System.out.println("Tipo:" + tipo);

        Service service = new Service();
        List<String> descricoes = new ArrayList<>();
        descricoes.add(descricao);

        HttpSession httpSession;
        httpSession = req.getSession();

        Double valorEntrada = (Double) httpSession.getAttribute("valorEntrada");
        if (valorEntrada == null){
            valorEntrada = 0.0;
        }

        Double valorSaida = (Double) httpSession.getAttribute("valorSaida");
        if (valorSaida == null){
            valorSaida = 0.0;
        }

        Double saldo = (Double) httpSession.getAttribute("saldo");
        if (saldo == null){
            saldo = 0.0;
        }

        if (tipo.equals("entrada")){

            double valorEntradas = Double.parseDouble(valor);
            valorEntrada += valorEntradas;
            httpSession.setAttribute("valorEntrada", valorEntrada);
        } else{
            double valorSaidas = Double.parseDouble(valor);
            valorSaida += valorSaidas;
            httpSession.setAttribute("valorSaida", valorSaida);
        }

        service.setEntradasMes(valorEntrada);
        service.setSaidasMes(valorSaida);

        service.atualizarSaldo();
        saldo += service.getSaldoAtual();

        System.out.println("-----Total: " + service.getSaldoAtual() + "-------");

        for (int i = 0; i < descricoes.size(); i++) {
            req.setAttribute("descricao", descricoes.get(i));
        }
        req.setAttribute("saldo", saldo);
        req.setAttribute("valorEntrada", valorEntrada);
        req.setAttribute("valorSaida", valorSaida);
        req.getRequestDispatcher("/").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req,resp);
    }
}
