package br.edu.camporeal.projetointegrador.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.edu.camporeal.projetointegrador.model.Pessoa;
import br.edu.camporeal.projetointegrador.request.PessoaRequestModel;
import br.edu.camporeal.projetointegrador.service.PessoaService;

import java.util.List;

@RestController
@RequestMapping("/pessoas")
public class PessoaController {

    @Autowired
    private PessoaService pessoaService;

    @GetMapping
    public ResponseEntity<List<Pessoa>> listarPessoas() {
        return new ResponseEntity<List<Pessoa>>(pessoaService.listarTodasPessoas(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Pessoa> getPessoaById(@PathVariable Integer id) {
        Pessoa pessoa = pessoaService.buscarPessoaPorId(id);
        
        if (pessoa == null) {
            return new ResponseEntity<>(pessoa, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Long> criarPessoa(@RequestBody PessoaRequestModel pessoaRequest) {
        Long pessoaId = pessoaService.inserirPessoa(pessoaRequest);

        if (pessoaId != null) {
            return new ResponseEntity<>(pessoaId, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}