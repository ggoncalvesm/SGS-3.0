<%@page import="br.ufc.sgs.modelo.usuario.Gerente"%>
<%@page import="br.ufc.sgs.model.concurso.Concurso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.ufc.sgs.dao.ConcursoDAO"%>
<%@page import="br.ufc.sgs.dao.ConcursoDAO"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>

<%
        if(request.getAttribute("listaConcursos") == null){
            ConexaoFactory conexao = new ConexaoFactory();
            ConcursoDAO concursoDAO = new ConcursoDAO(conexao.abreConexao());
            request.setAttribute("listaConcursos", concursoDAO.getConcursos());
            conexao.fechaConexao();
        }
        request.getSession().setAttribute("usuario", new Gerente(1, "Teste", "asdasd", "asdasd"));
        
        if(request.getSession().getAttribute("usuario") == null){
            response.sendRedirect("login.jsp");
        }
%>
<div id="header">
      <h1><a href="index.html">SGS - Sistema de Gerenciamento de Seleções</a></h1>
      <div id="user-navigation">
        <ul class="wat-cf">
          <li><a href="#">Perfil</a></li>
          <li><a href="#">Configurações</a></li>
          <li><a class="logout" href="#">Sair</a></li>
        </ul>
      </div>
      <div id="main-navigation">
        <ul class="wat-cf">
          <li class="active"><a href="principal.jsp">Página Inicial</a></li>
          <li class=""><a href="#block-text">Concursos</a></li>
        </ul>
      </div>
</div>
