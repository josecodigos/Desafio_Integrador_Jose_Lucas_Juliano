package br.edu.camporeal.projetointegrador.model;

import javax.persistence.*;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "projetos")
@Getter
@Setter
public class Projeto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titulo;
    private String linguagem;
    private String curso;
    private String disciplina;
    private Date dataRealizacao;
    private byte[] arquivo;
    private String descricao;

    @OneToMany(mappedBy = "pessoa")
    private List<Pessoa> pessoas;
}
