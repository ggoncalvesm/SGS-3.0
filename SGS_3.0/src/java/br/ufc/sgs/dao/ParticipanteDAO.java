/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.sgs.dao;

import br.ufc.sgs.model.concurso.Documento;
import br.ufc.sgs.model.concurso.Participante;
import br.ufc.sgs.model.concurso.Resultado;
import br.ufc.sgs.model.exceptions.DadoInvalidoException;
import br.ufc.sgs.modelo.usuario.Candidato;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author alexf
 */
public class ParticipanteDAO extends ExecutaSQL{
    
    public ParticipanteDAO(Connection conexao) {
        super(conexao);
    }
    
    public Collection<Participante> getParticipantes(){
        return null;
    }
    
    public Collection<Participante> getParticipantes(int id_fase){
        try{
            String sql = "SELECT id, id_candidato, id_resultado FROM PARTICIPANTE WHERE id_fase=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setInt(1, id_fase);
            ResultSet rs = ps.executeQuery();

            Collection<Participante> participantes = new ArrayList<>();
            while(rs.next()){
                int id_participante = rs.getInt("id");
                int id_candidato = rs.getInt("id_candidato");
                int id_resultado = rs.getInt("id_resultado");
                
                Candidato candidato = new CandidatoDAO(getConexao()).getCandidato(id_candidato);
                Collection<Documento> documentos = new DocumentoDAO(getConexao()).getDocumentosDoParticipante(id_participante);
                Resultado resultado = new ResultadoDAO(getConexao()).getResultado(id_resultado);
                participantes.add(new Participante(candidato, documentos, resultado));
            }
            return participantes;
        } catch(SQLException ex){
            System.err.println("Erro com a sintaxe SQL no metodo de consulta. participantesDAO");    
        } catch(DadoInvalidoException ex){
            
        }
    
        return null;
    }
}
