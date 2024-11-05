package br.edu.camporeal.projetointegrador.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.edu.camporeal.projetointegrador.model.Projeto;

public interface ProjetoRepository extends JpaRepository<Projeto, Integer> {
    List<Projeto> findByPessoaId(Integer pessoaId);
}
