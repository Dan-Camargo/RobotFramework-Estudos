*** Settings ***
Resource        ../Resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar navegador



*** Test Cases ***
Verificar se ao preencher o formulário *corretamente* os dados são inseridos na lista e se um novo card é criado no time esperado

    Dado que o usuário preencha os campos do formulário corretamente
    E Clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possível criar mais de um card

    Dado que o usuário preencha os campos do formulário corretamente
    E Clique no botão criar card
    Então identificar três cards nos times esperados

Verificar se é possível criar um card para cada time disponível se preenchido corretamente

    Dado que o usuário preencha os campos do formulário corretamente
    Então criar e identificar 1 card em cada time disponível