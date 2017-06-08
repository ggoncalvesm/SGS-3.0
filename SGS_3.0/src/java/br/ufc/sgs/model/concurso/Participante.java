/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.sgs.model.concurso;

import br.ufc.sgs.modelo.usuario.Candidato;
import java.util.Collection;

/**
 *
 * @author alexf
 */
public class Participante {
    private Candidato candidato;
    private Collection<Documento> documentos;
    private Resultado resultado;

    public Participante(Candidato candidato, Collection<Documento> documentos, Resultado resultado) {
        setCandidato(candidato);
        setDocumentos(documentos);
        setResultado(resultado);
    }

    public Candidato getCandidato() {
        return candidato;
    }

    public void setCandidato(Candidato candidato) {
        this.candidato = candidato;
    }

    public Collection<Documento> getDocumentos() {
        return documentos;
    }

    public void setDocumentos(Collection<Documento> documentos) {
        this.documentos = documentos;
    }

    public Resultado getResultado() {
        return resultado;
    }

    public void setResultado(Resultado resultado) {
        this.resultado = resultado;
    }
    
}
