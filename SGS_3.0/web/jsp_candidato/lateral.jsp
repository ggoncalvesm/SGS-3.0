<%@page import="java.util.ArrayList"%>
<%@page import="br.ufc.sgs.dao.ConcursoDAO"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>
<%@page import="br.ufc.sgs.dao.ConexaoFactory"%>
<%@page import="br.ufc.sgs.model.concurso.Concurso"%>

    <div class="block notice">
        <h4>Not�cias</h4>
        
    <%
        for(Concurso c: (ArrayList<Concurso>) request.getAttribute("listaConcursos")){
                if(!c.isIsDivulgado()){
        %>
        
            <div id="carousel-example-generic" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <p>Novo concurso aberto!</p>
                        <p>Veja mais informa��es sobre: <%= c.getTitulo()%></p>
                    </div>
                </div>    
            </div>
                    
        <%      }
            }
        %>
    </div>
    