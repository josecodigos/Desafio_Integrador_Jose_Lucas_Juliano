package br.edu.camporeal.projetointegrador.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.edu.camporeal.projetointegrador.model.Pessoa;
import br.edu.camporeal.projetointegrador.model.Projeto;
import br.edu.camporeal.projetointegrador.repository.PessoaRepository;
import br.edu.camporeal.projetointegrador.repository.ProjetoRepository;
import br.edu.camporeal.projetointegrador.request.ProjetoRequestModel;

import java.util.List;
import java.util.Optional;

@Service
public class ProjetoService {

    @Autowired
    private ProjetoRepository projetoRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    public Projeto buscarProjetoPorId(Integer id) {
        Optional<Projeto> projeto = projetoRepository.findById(id);
        
        if (projeto.isPresent()) {
            return projeto.get();
        } else {
            return null;
        }
    }

    public Long inserirProjeto(ProjetoRequestModel projetoRequest) {
        Projeto projeto = new Projeto();
        projeto.setTitulo(projetoRequest.getTitulo());
        projeto.setLinguagem(projetoRequest.getLinguagem());
        projeto.setCurso(projetoRequest.getCurso());
        projeto.setDisciplina(projetoRequest.getDisciplina());
        projeto.setDataRealizacao(projetoRequest.getDataRealizacao());
        projeto.setArquivo(projetoRequest.getArquivo());
        projeto.setDescricao(projetoRequest.getDescricao());

        List<Pessoa> pessoasAssociadas = pessoaRepository.findAllById(projetoRequest.getPessoasIds());

        if (!pessoasAssociadas.isEmpty()) {
            projeto.setPessoas(pessoasAssociadas);
            projetoRepository.save(projeto);
            return projeto.getId();
        } else {
            return null;
        }
    }

    public List<Projeto> buscarProjetosPorPessoa(Integer pessoaId) {
        return projetoRepository.findByPessoaId(pessoaId);
    }
}
