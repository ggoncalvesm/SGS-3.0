/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.sgs.controle;

import br.ufc.sgs.dao.ConcursoDAO;
import br.ufc.sgs.dao.ConexaoFactory;
import br.ufc.sgs.model.concurso.Concurso;
import br.ufc.sgs.model.concurso.Documento;
import br.ufc.sgs.model.concurso.Fase;
import br.ufc.sgs.model.concurso.Selecao;
import br.ufc.sgs.model.exceptions.ServletControllerException;
import br.ufc.sgs.modelo.usuario.Gerente;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;    
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Gabriel
 */
public class CadastraConcurso implements Logica{

    @Override
    public String executa(HttpServletRequest request, HttpServletResponse response) throws ServletControllerException {
        ConexaoFactory conexao = new ConexaoFactory();
        try{
            int id_gerente = ((Gerente) request.getSession().getAttribute("usuario")).getId();
            String titulo = request.getParameter("titulo");
            String descricao = request.getParameter("descricao");
            Documento edital = uploadDocumento(request);
            String preRequisitos = request.getParameter("preRequisitos");
            String maisInformacoes = request.getParameter("maisInformacoes");
            boolean isDivulgado = Boolean.getBoolean(request.getParameter("isDivulgado"));
            Concurso concurso = new Concurso(titulo, descricao, edital, preRequisitos, maisInformacoes, isDivulgado, new ArrayList<Documento>(), new ArrayList<Selecao>(), new ArrayList<Fase>());
            ConcursoDAO concursoDAO = new ConcursoDAO(conexao.abreConexao());
            if(concursoDAO.cadastraConcurso(concurso, id_gerente)){
                return "jsp_gerente/principal.jsp";
            }else{
                request.setAttribute("mensagem", "Cadastro não realizado!");
                return "jsp_gerente/cadastrar_concurso.jsp";
            }
        }catch (SQLException ex) {
            request.setAttribute("mensagem", "Erro no SQL");
            System.out.println("Erro no código SQL");
            return "login.jsp";
        } catch (FileUploadException ex) {
            Logger.getLogger(CadastraConcurso.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            conexao.fechaConexao();
        }
        return null;
    }

    private Documento uploadDocumento(HttpServletRequest request) throws FileUploadException{
        String endereco = request.getParameter("edital");
        ServletContext context = request.getServletContext();  
        String enderecoCompleto = context.getRealPath(endereco);
        return new Documento(0, "teste", new File(enderecoCompleto));

    }
}
