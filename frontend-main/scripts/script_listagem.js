$(document).ready(function(){
    var data = [
        {
            "name":"Nicoly do Prado Gravonski",
            "idade": "19",
            "periodo": "4",
        },
        {
            "name":"Sabrina Surmacz Valentim",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"José Antonio Molinari de Andrade",
            "idade": "19",
            "periodo": "4",
        },
        {
            "name":"Joao Vitor",
            "idade":"18",
            "periodo":"2",
        },
        {
            "name":"Maria Clara",
            "idade": "19",
            "periodo": "2",
        },
        {
            "name":"Gabriel Pires",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"Juliano Orchel",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"Lucas Marcos Sequinel",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"Neuri Eduardo de Lima",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"Bernardo Zanlorenzi",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"Lucas Thomaz",
            "idade":"19",
            "periodo":"4",
        },
        {
            "name":"Mariana",
            "idade":"19",
            "periodo":"2",
        },
        {
            "name":"Laura",
            "idade":"17",
            "periodo":"1",
        },
        {
            "name":"Julia",
            "idade":"17",
            "periodo":"1",
        },
        {
            "name":"Giulia",
            "idade":"19",
            "periodo":"2",
        }
    ]
    
    $('#dataTable').DataTable( {
        data: data,
        columns: [
            { data: 'name', title: 'Nome' },
            { data: 'idade', title: 'Idade' },
            { data: 'periodo', title: 'Período'}
        ],
       
    } );
    
})
