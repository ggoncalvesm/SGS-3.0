<%@page import="br.ufc.sgs.model.concurso.Participante"%>
<%@page import="br.ufc.sgs.modelo.usuario.Avaliador"%>
<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="br.ufc.sgs.model.concurso.Selecao"%>
<%@page import="br.ufc.sgs.model.concurso.Fase"%>
<%@page import="br.ufc.sgs.model.concurso.Concurso"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>SGS - Sistema de Gerenciamento de Sele��es</title>
  <link rel="stylesheet" href="../theme/stylesheets/base.css" type="text/css" media="screen" />
  <link rel="stylesheet" id="current-theme" href="../theme/stylesheets/themes/default/style.css" type="text/css" media="screen" />
  <script type="text/javascript" charset="utf-8" src="../theme/javascripts/jquery-1.3.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="../theme/javascripts/jquery.scrollTo.js"></script>
  <script type="text/javascript" charset="utf-8" src="../theme/javascripts/jquery.localscroll.js"></script>
  
  <script type="text/javascript" charset="utf-8">
    // <![CDATA[
    var Theme = {
      activate: function(name) {
        window.location.hash = 'themes/' + name
        Theme.loadCurrent();
      },

      loadCurrent: function() {
        var hash = window.location.hash;
        if (hash.length > 0) {
          matches = hash.match(/^#themes\/([a-z0-9\-_]+)$/);
          if (matches && matches.length > 1) {
            $('#current-theme').attr('href', 'stylesheets/themes/' + matches[1] + '/style.css');
          } else {
            alert('theme not valid');
          }
        }
      }
    }

    $(document).ready(function() {
      Theme.loadCurrent();
      $.localScroll();
      $('.table :checkbox.toggle').each(function(i, toggle) {
        $(toggle).change(function(e) {
          $(toggle).parents('table:first').find(':checkbox:not(.toggle)').each(function(j, checkbox) {
            checkbox.checked = !checkbox.checked;
          })
        });
      });
    });
    // ]]>
    
    function block_modificado(block){
        for(i = 1;i <= 5;i++)
            document.getElementById("item"+i).className = "desactive";
        block.className = "active";
    }
  </script>
  
</head>
<body>
    <div id="container">
    <%@include file="cabecalho.jsp" %>
    <%
        Integer id_fase = 0;
        if(request.getParameter("id_fase") != null) id_fase = Integer.parseInt(request.getParameter("id_fase"));
        else{
            
            request.setAttribute("mensagem", "Por favor, especifique o concurso;");
        }
        ArrayList<Concurso> listaConcursos = (ArrayList) request.getAttribute("listaConcursos");
        Fase fase = null;
        for(Concurso c: listaConcursos){
            for(Fase f: c.getFases()){
                if(f.getId() == id_fase){
                    fase = f;
                    break;
                }
            }
            
        }

        
        if(fase == null){
            request.setAttribute("mensagem", "Por favor, especifique a fase;");
        }
    %>
    <div id="wrapper" class="wat-cf">
        <div id="main">
            <div class="block" id="block-text">
                <div class="content">
                  <h2 class="title"><%= fase.getTitulo() %></h2>
                  <div class="inner">
                    <p class="first">
                        <%= fase.getDescricao() %>

                    </p>
                        <p><b>Data de In�cio: </b><span class=""><%= fase.getDataInicio().format(DateTimeFormatter.ofPattern("dd/MM/YYYY")) %></span></p>
                        <p><b>Data de T�rmino: </b> <span class=""><%= fase.getDataTermino().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%></span></p>
                        <p><b>Crit�rio de Sele��o: </b> <span class=""><%= fase.getCriterioDeSelecao()%></span></p>
                        <%--Tem que colocar os documentos requisitados aqui, pq eu n�o fa�o a m�nima ideia e tem que fazer algo pra editar o crit�rio de sele��o --%>    
                    <hr />
                  </div>
                </div>
                    <div class="content" id="block-fases">
                    <div class="inner">
                        
                        <h3>Avaliadores</h3>  
                      <form action="#" class="form">
                        <table class="table">
                          <tr style="text-align: center">
                                <th class="first"></th>
                                <th><b>Nome</b></th>
                                <th><b>Email</b></th>
                                <th  class="last"><b>Op��es</b></th>
                          </tr>
                          <tbody>
                          <%
                              for(Avaliador avaliador: fase.getAvaliadores() ){
                          %>
                                <tr class="odd">
                                    <td></td>
                                    <td><%= avaliador.getNome() %></td>
                                    <td><%= avaliador.getEmail() %> </td>
                                    <td class="last">
                                        <center>
                                            <a href="#">visualizar</a> | 
                                            <a href="#">editar</a> 
                                        </center>
                                    </td>
                                </tr>
                                        
                                        
                          <%
                              }
                          %>
                          </tbody>
                        </table>
                        <a href="cadastrar_avaliador.jsp?id_fase=<%= fase.getId()%>" class="button" >
                            <img src="../theme/images/icons/add.png" alt="Adicionar avaliador" /> Adicionar avaliador
                        </a>
                        <br/>
                      </form>
                    </div>
                </div>  
                <br/>          
                <hr/>
                <br/>
                <div class="content" id="block-fases">
                    <div class="inner">
                        
                        <h3>Participantes</h3>  
                      <form action="#" class="form">
                        <table class="table">
                          <tr style="text-align: center">
                                <th class="first"></th>
                                <th><b>Nome</b></th>
                                <th><b>Email</b></th>
                                <th><b>Matricula</b></th>
                                <th><b>Curso</b></th>
                                <th><b>Ano de Entrada</b></th>
                                <!-- Tem que colocar a situa��o do candidato aqui -->
                                <th  class="last"><b>Op��es</b></th>
                          </tr>
                          <tbody>
                          <%
                              for(Participante participante: fase.getParticipantes() ){
                          %>
                                <tr class="odd">
                                    <td></td>
                                    <td><%= participante.getCandidato().getNome() %></td>
                                    <td><%= participante.getCandidato().getEmail() %> </td>
                                    <td><%= participante.getCandidato().getMatricula() %> </td>
                                    <td><%= participante.getCandidato().getCurso() %> </td>
                                    <td><%= participante.getCandidato().getAno_entrada()%> </td>
                                    <td class="last">
                                        <center>
                                            <a href="#">visualizar</a> | 
                                            <a href="#">editar</a> 
                                        </center>
                                    </td>
                                </tr>
                                        
                                        
                          <%
                              }
                          %>
                          </tbody>
                        <br/>
                      </form>
                    </div>
                </div>  
                <br/>          
                <hr/>
                <br/>
            </div>
                                  
                                    
            <div id="footer">
              <div class="block">
                <p>Copyright &copy; 2017 SGS- Sistema de Gerenciamento de Sele��es.</p>
              </div>
            </div>
        </div>
        
        
                    
        <div id="sidebar">
        <%@include file="lateral.jsp"%>
      </div>
    </div>
  </div>
</body>
</html>

