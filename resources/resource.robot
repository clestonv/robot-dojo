*** Settings ***
Documentation        Arquivo das Bibliotecas

Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${baseUrl}    https://develop.qacoders-academy.com.br/api/
${id_user}    661c585d14ff021dc447c556

*** Keywords ***
Criar Sessao
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=develop    url=${baseUrl}    headers=${headers}    verify=true

Pegar Token
    ${body}    Create Dictionary    
    ...    mail=sysadmin@qacoders.com    
    ...    password=1234@Test
    # Log    ${body}
    Criar Sessao
    ${resposta}    POST On Session    alias=develop    url=/login    json=${body}
    Status Should Be    200    ${resposta}
    RETURN                    ${resposta.json()["token"]}