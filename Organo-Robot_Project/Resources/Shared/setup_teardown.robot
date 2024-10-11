*** Settings ***
Library  SeleniumLibrary
Resource        ../main.robot

*** Keywords ***
Dado que eu acesse o Organo
    Open Browser    url=http://localhost:3000/    browser=headlessfirefox
    
Fechar navegador
    Close Browser
