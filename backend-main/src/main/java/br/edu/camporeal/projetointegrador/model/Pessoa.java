package br.edu.camporeal.projetointegrador.model;

import javax.persistence.*;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "pessoas")
@Getter
@Setter
public class Pessoa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private byte[] foto64;
    private String curso;
    private Integer periodo;
    private String email;
    private Date dataNascimento;
    private String linkGithub;
    private String descricao;

    @OneToMany(mappedBy = "projeto")
    private List<Projeto> projeto;
}
