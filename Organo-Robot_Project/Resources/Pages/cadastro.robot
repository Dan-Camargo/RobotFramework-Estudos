*** Settings ***
Resource        ../main.robot

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
@{SELECIONAR_TIMES}       
...     //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...       //option[contains(.,'Data Science')]
...        //option[contains(.,'Devops')] 
...         //option[contains(.,'UX e Design')]
...          //option[contains(.,'Mobile')]
...           //option[contains(.,'Inovação e Gestão')]

*** Keywords ***

Dado que o usuário preencha os campos do formulário corretamente

    ${Nome}        FakerLibrary.First Name
    Input Text      ${CAMPO_NOME}     ${Nome}

    ${Cargo}       FakerLibrary.Job
    Input Text      ${CAMPO_CARGO}    ${Cargo}

    ${Imagem}      FakerLibrary.Image Url  width=100   height=100
    Input Text      ${CAMPO_IMAGEM}   ${Imagem}

    Click Element   ${CAMPO_TIME}
    Click Element   ${SELECIONAR_TIMES}[0]
E Clique no botão criar card
    Click Button    ${BOTAO_CARD}
    
Então identificar o card no time esperado
    Element Should Be Visible  class:colaborador


Então identificar três cards nos times esperados
    FOR    ${i}    IN RANGE    1   3
        Dado que o usuário preencha os campos do formulário corretamente
        E Clique no botão criar card
    END

Então criar e identificar 1 card em cada time disponível
    FOR    ${i}    ${TIME}    IN ENUMERATE    @{SELECIONAR_TIMES}
        Dado que o usuário preencha os campos do formulário corretamente
        Click Element    ${TIME}
        E Clique no botão criar card
    END

Dado que eu clique no botão criar card
    Click Button    ${BOTAO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro