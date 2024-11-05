package br.edu.camporeal.projetointegrador.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.edu.camporeal.projetointegrador.model.Pessoa;
import br.edu.camporeal.projetointegrador.repository.PessoaRepository;
import br.edu.camporeal.projetointegrador.request.PessoaRequestModel;

import java.util.List;
import java.util.Optional;

@Service
public class PessoaService {

    @Autowired
    private PessoaRepository pessoaRepository;

    public List<Pessoa> listarTodasPessoas() {
        return pessoaRepository.findAll();
    }

    public Pessoa buscarPessoaPorId(Integer id) {
        Optional<Pessoa> pessoa = pessoaRepository.findById(id);
        
        if (pessoa.isPresent()) {
            return pessoa.get();
        } else {
            return null;
        }
    }

    public Long inserirPessoa(PessoaRequestModel pessoaRequest) {
        Pessoa pessoa = new Pessoa();
        pessoa.setNome(pessoaRequest.getNome());
        pessoa.setFoto64(pessoaRequest.getFoto64());
        pessoa.setCurso(pessoaRequest.getCurso());
        pessoa.setPeriodo(pessoaRequest.getPeriodo());
        pessoa.setEmail(pessoaRequest.getEmail());
        pessoa.setDataNascimento(pessoaRequest.getDataNascimento());
        pessoa.setLinkGithub(pessoaRequest.getLinkGithub());
        pessoa.setDescricao(pessoaRequest.getDescricao());

        Pessoa pessoaSalva = pessoaRepository.save(pessoa);
        return pessoaSalva.getId();
    }
}
