$(document).ready(function(){
    const carregarAluno = () => {
        fetch(`http://localhost:5000/aluno`)
            .then(response => response.json())
            .then(data => {
                const html = data.element.reduce((acumulador, item) => {
                    alunoJSON[acumulador] = item;
                    acumulador ++;
                    return alunoJSON;
                }, '');

                const tableBody = document.querySelector('[data-js= "idPegaAluno"]');
                tableBody.innerHTML = html;
            })
            .catch(err => console.log("Erro ao buscar atividades do aluno:", err));
    }

    $('#dataTable').DataTable( {
        data: al,
        columns: [
            { data: 'nome', title: 'Nome' },
            { data: 'email', title: 'Email' },
            { data: 'data_nascimento', title: 'Data de nascimneto'},
            { data: 'usuarioGitHub', title: 'Usuário do GitHub'},
            { date: 'descricao', title:'Descrição'}
        ],
       
    } );
    
})
