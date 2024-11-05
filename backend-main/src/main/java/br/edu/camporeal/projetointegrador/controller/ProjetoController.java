package br.edu.camporeal.projetointegrador.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.edu.camporeal.projetointegrador.model.Projeto;
import br.edu.camporeal.projetointegrador.request.ProjetoRequestModel;
import br.edu.camporeal.projetointegrador.service.ProjetoService;

@RestController
@RequestMapping("/projetos")
public class ProjetoController {

    @Autowired
    private ProjetoService projetoService;

    @GetMapping("/{id}")
    public ResponseEntity<Projeto> getProjetoById(@PathVariable Integer id) {
        Projeto projeto = projetoService.buscarProjetoPorId(id);
        
        if (projeto == null) {
            return new ResponseEntity<>(projeto, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<Projeto>> listarProjetosPorPessoa(@RequestParam Integer pessoaId) {
        List<Projeto> projetos = projetoService.buscarProjetosPorPessoa(pessoaId);

        if (!projetos.isEmpty()) {
            return new ResponseEntity<>(projetos, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Long> criarProjeto(@RequestBody ProjetoRequestModel projetoRequest) {
        Long projetoId = projetoService.inserirProjeto(projetoRequest);

        if (projetoId != null) {
            return new ResponseEntity<>(projetoId, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
