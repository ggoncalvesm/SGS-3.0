/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.sgs.dao;

import br.ufc.sgs.model.concurso.Documento;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Scanner;

/**
 *
 * @author alexf
 */
public class DocumentoDAO extends ExecutaSQL{
    
    public DocumentoDAO(Connection conexao) {
        super(conexao);
    }
    
    public Documento getDocumento(int id_documento){
        try {
            PreparedStatement ps = getConexao().prepareStatement("SELECT nome, arquivo FROM DOCUMENTO WHERE id = ?");
            ps.setInt(1, id_documento);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String nome = rs.getString("nome");
                byte [] arquivoBytes = rs.getBytes("arquivo");

                File arquivo = new File(nome);
                FileOutputStream fos = new FileOutputStream(arquivo);
                fos.write(arquivoBytes);
                fos.close();
                return new Documento(id_documento, nome, arquivo);
            }
            rs.close();
            ps.close();
            
        } catch (SQLException | IOException ex) {
            System.out.println(ex.getMessage());
        }
        return null;        
    }

    public Collection<Documento> getDocumentosDoConcurso(int id_concurso) {
        ArrayList<Documento> documentos = new ArrayList<>();
        try {
            PreparedStatement ps = getConexao().prepareStatement("SELECT id, nome, arquivo FROM DOCUMENTO WHERE id_concurso = ?");
            ps.setInt(1, id_concurso);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                byte [] arquivoBytes = rs.getBytes("arquivo");

                File arquivo = new File(nome);
                FileOutputStream fos = new FileOutputStream(arquivo);
                fos.write(arquivoBytes);
                fos.close();
                documentos.add(new Documento(id, nome, arquivo));
            }
            rs.close();
            ps.close();
            return documentos;
        } catch (SQLException | IOException ex) {
            System.out.println(ex.toString());
        }
        return null;
    }

    public Collection<Documento> getDocumentosDoParticipante(int id_fase) {
        //T� faltando isso aqui!! N�o?!
        return null;
    }

}
