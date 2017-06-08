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
public class ResultadoDAO extends ExecutaSQL{
    
    ResultadoDAO(Connection conexao) {
        super(conexao);
    }

    Resultado getResultado(int id_resultado) {
        try{
            String sql = "SELECT id, nota, motivo FROM RESULTADO WHERE id=?";
            PreparedStatement ps = getConexao().prepareStatement(sql);
            ps.setInt(1, id_resultado);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                float nota = rs.getFloat("nota");
                String motivo = rs.getString("motivo");
                return new Resultado(id_resultado, nota, motivo);
            }
            return null;
        } catch(SQLException ex){
            System.err.println("Erro com a sintaxe SQL no metodo de consulta. participantesDAO");    
        }
    
        return null;        
    }
    
}
