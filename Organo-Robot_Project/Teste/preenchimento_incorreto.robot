*** Settings ***
Resource        ../Resources/main.robot
Test Setup  Dado que eu acesse o Organo
Test Teardown  Fechar navegador

*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema exibe a mensagem de campo obrigatório
    
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório
