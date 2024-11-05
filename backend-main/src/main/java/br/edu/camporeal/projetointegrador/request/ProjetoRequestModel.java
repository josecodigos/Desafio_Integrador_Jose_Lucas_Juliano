package br.edu.camporeal.projetointegrador.request;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProjetoRequestModel {
    private String titulo;
    private String linguagem;
    private String curso;
    private String disciplina;
    private Date dataRealizacao;
    private byte[] arquivo;
    private String descricao;
    private List<Integer> pessoasIds;
}
