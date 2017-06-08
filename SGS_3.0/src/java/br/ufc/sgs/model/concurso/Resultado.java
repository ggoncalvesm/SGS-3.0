/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.sgs.model.concurso;

import br.ufc.sgs.model.exceptions.DadoInvalidoException;

/**
 *
 * @author alexf
 */
public class Resultado {
    private final int id;
    private float nota;
    private String motivo; 

    public Resultado(int id, float nota, String motivo) {
        this.id = id;
        this.nota = nota;
        this.motivo = motivo;
    }

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) throws DadoInvalidoException{
        if(nota < 0.0 || nota > 10.0) throw new DadoInvalidoException("Nota não pertence ao conjunto de valores válidos");
        else this.nota = nota;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    
}
