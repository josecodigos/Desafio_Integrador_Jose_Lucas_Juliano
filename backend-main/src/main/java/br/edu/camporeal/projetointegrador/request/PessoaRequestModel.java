package br.edu.camporeal.projetointegrador.request;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PessoaRequestModel {
    private String nome;
    private byte[] foto64;
    private String curso;
    private Integer periodo;
    private String email;
    private Date dataNascimento;
    private String linkGithub;
    private String descricao;
}
