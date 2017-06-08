/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufc.sgs.model.concursos.criteriosDeSelecao;

import br.ufc.sgs.model.concurso.Participante;

/**
 *
 * @author alexf
 */
public interface CriterioDeSelecao {
    public boolean isAprovado(Participante participante);
    public boolean isClassificado(Participante participante);
    
}
