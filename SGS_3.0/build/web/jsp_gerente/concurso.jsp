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
  <link href="../jquery-ui/jquery-ui.css" rel="stylesheet"></link>
  
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
        Integer id_concurso = 0;
        if(request.getParameter("id") != null) id_concurso = Integer.parseInt(request.getParameter("id"));
        else{
            
            request.setAttribute("mensagem", "Por favor, especifique o concurso;");
        }
        ArrayList<Concurso> listaConcursos = (ArrayList) request.getAttribute("listaConcursos");
        Concurso concurso = null;
        for(Concurso c: listaConcursos){
            if(c.getId() == id_concurso){
                concurso = c;
                break;
            }
        }
        
        if(concurso == null){
            request.setAttribute("mensagem", "Por favor, especifique o concurso;");
        }
    %>
    <div id="wrapper" class="wat-cf">
        <div id="main">
            
            <div class="block" id="block_descricao">
                <div class="secondary-navigation">
                    <ul class="wat-cf" id="itens">
                        <li class="active" id="item1" onclick="block_modificado(this)"><a href="#block_descricao" >Descri��o geral</a></li>
                        <li id="item2" onclick="block_modificado(this)"><a href="#block-fases">Fases</a></li>
                        <li id="item3" onclick="block_modificado('block-selecoes')"><a href="#block-selecoes">Sele��es</a></li>
                        <li id="item4" onclick="block_modificado('block-avaliadores')"><a href="#block-avaliadores">Avaliadores</a></li>
                        <li id="item5" onclick="block_modificado('block-candidatos')"><a href="#block-candidatos">Candidatos</a></li>
                    </ul>
                </div>
                <div class="content">
                    <h2 class="title"><%= concurso.getTitulo() %></h2>
                    <div class="inner">
                        <p class="first">
                            <%= concurso.getDescricao() %>
                        </p>
                        <hr />
                    </div>
                </div>
                        
                        
                        
                <div class="content" id="block-fases">
                    <div class="inner">
                        
                        <h3>Fases do concurso</h3>  
                      <form action="#" class="form">
                        <table class="table">
                          <tr style="text-align: center">
                                <th class="first"></th>
                                <th><b>Titulo</b></th>
                                <th><b>Data de inicio</b></th>
                                <th><b>Data de t�rmino</b></th>
                                <th><b>Crit�rio de sele��o</b></th>
                                <th  class="last"><b>Op��es</b></th>
                          </tr>
                          <tbody>
                          <%
                              for(Fase fase: concurso.getFases() ){
                          %>
                                <tr class="odd">
                                    <td></td>
                                    <td><%= fase.getTitulo() %></td>
                                    <td><%= fase.getDataInicio() %> </td>
                                    <td><%= fase.getDataTermino() %></td>
                                    <td><%= fase.getCriterioDeSelecao() %></td>
                                    <td class="last">
                                        <center>
                                            <a href="fase.jsp?id_fase=<%= fase.getId() %>">visualizar</a> | 
                                            <a href="editar_fase.jsp?id_fase=<%= fase.getId() %>">editar</a> 
                                        </center>
                                    </td>
                                </tr>
                                        
                                        
                          <%
                              }
                          %>
                          </tbody>
                        </table>
                        <a href="cadastrar_fase.jsp" class="button" >
                            <img src="../theme/images/icons/add.png" alt="Adicionar fase" /> Adicionar fase
                        </a>
                        <br/>
                      </form>
                    </div>
                </div>  
                <br/>          
                <hr/>
                <br/>
                <div class="content" id="block-selecoes">
                    <div class="inner">
                        
                        <h3>Sele��es do concurso</h3>  
                      <form action="#" class="form">
                        <table class="table">
                          <tr style="text-align: center">
                                <th><b>Titulo</b></th>
                                <th><b>Respons�vel</b></th>
                                <th><b>�rea</b></th>
                                <th><b>Vagas remuneradas</b></th>
                                <th><b>Vagas volunt�rias</b></th>
                                <th  class="last"><b>Op��es</b></th>
                          </tr>
                          <tbody>
                          <%
                              for(Selecao selecao: concurso.getSelecoes()){
                          %>
                                <tr class="odd">
                                    <td><%= selecao.getTitulo() %></td>
                                    <td><%= selecao.getResponsavel()%></td>
                                    <td><%= selecao.getArea()%> </td>
                                    <td><%= selecao.getVagasRemuneradas()%></td>
                                    <td><%= selecao.getVagasVoluntarias()%></td>
                                    <td class="last">
                                        <center>
                                            <a href="selecao.jsp?id=<%= selecao.getId() %>">visualizar</a> | 
                                            <a href="editar_selecao.jsp?id=<%= selecao.getId() %>">editar</a> 
                                        </center>
                                    </td>
                                </tr>
                          <%
                              }
                          %>
                          </tbody>
                        </table>
                        <a href="cadastrar_selecao.jsp" class="button" >
                            <img src="../theme/images/icons/add.png" alt="Adicionar fase" /> Adicionar sele��o
                        </a>
                        <br/>
                      </form>
                    </div>
                </div>     

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
<script src="../jquery-ui/external/jquery/jquery.js"></script>
<script src="../jquery-ui/jquery-ui.js"></script>      
</body>
</html>

