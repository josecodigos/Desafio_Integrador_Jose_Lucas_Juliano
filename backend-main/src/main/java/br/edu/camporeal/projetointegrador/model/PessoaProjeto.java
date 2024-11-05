package br.edu.camporeal.projetointegrador.model;

import javax.persistence.*;

@Entity
@Table(name = "pessoas_projetos")
public class PessoaProjeto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkpessoa")
    private Pessoa pessoa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fkprojeto")
    private Projeto projeto;
}
