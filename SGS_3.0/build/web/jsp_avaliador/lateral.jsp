<%@page import="java.util.ArrayList"%>
<%@page import="br.ufc.sgs.dao.ConcursoDAO"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>
<%@page import="br.ufc.sgs.model.concurso.Concurso"%>
    <div class="block notice">
        <h4>Not�cias</h4>  
    <%
        for(Concurso c: (ArrayList<Concurso>) request.getAttribute("listaConcursos")){
                if(!c.isEncerrada() && (c.getFaseAtual().getAvaliadores().contains(request.getSession().getAttribute("usuario")))){
        %>
                    <div id="carousel-example-generic" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active">
                                <p>Fase a ser encerrada!</p>
                                <p>O resultado da <%= c.getFaseAtual().getTitulo() %> est� pr�ximo de ser entregue. Confira voc� j� inseriu o resultado at� o dia <%=c.getFaseAtual().getDataTermino()%></p>
                            </div>
                        </div>    
                    </div>
        <%      }
            }
        %>

    </div>
