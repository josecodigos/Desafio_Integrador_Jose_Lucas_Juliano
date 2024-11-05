package br.edu.camporeal.projetointegrador.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.edu.camporeal.projetointegrador.model.Pessoa;

public interface PessoaRepository extends JpaRepository<Pessoa, Integer>{
    
}
