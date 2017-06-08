<%@page import="java.util.ArrayList"%>
<%@page import="br.ufc.sgs.dao.ConcursoDAO"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>
<%@page import="br.ufc.sgs.model.concurso.Concurso"%>
    <div class="block notice">
        <h4>Notícias</h4>  
    <%
        for(Concurso c: (ArrayList<Concurso>) request.getAttribute("listaConcursos")){
                if(!c.isEncerrada()){
        %>
                    <div id="carousel-example-generic" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active">
                                <p>Fase a ser encerrada!</p>
                                <p>O resultado da <%= c.getFaseAtual().getTitulo() %> está próximo de ser entregue. Confira se os resultados já estão cadastrados até o dia <%=c.getFaseAtual().getDataTermino()%></p>
                            </div>
                        </div>    
                    </div>
        <%      }
            }
        %>

    </div>
