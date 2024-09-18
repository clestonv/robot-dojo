*** Settings ***
Documentation    Keywords para o PATH /Users
Resource    resource.robot


*** Keywords ***
List Users
    [Documentation]    Retorna a listagem de usuários
    ${token}    Pegar Token
    ${resposta}    GET On Session    alias=develop    url=/user/?token=${token}
    Status Should Be    200    ${resposta}
    RETURN                     ${resposta.json()}
Create User
    ${token}    Pegar Token
    ${body}    Create Dictionary
    ...    fullName=Valentina Rayssa Sônia Lopes    
    ...    mail=valentina-lopes85@zipmail.com
    ...    password=1234@Test
    ...    accessProfile=ADMIN
    ...    cpf=41716806623
    ...    confirmPassword=1234@Test
    ${resposta}    POST On Session    alias=develop    url=/user/?token=${token}    json=${body}
    Status Should Be    201    ${resposta}
    RETURN    ${resposta.json()["user"]["_id"]}

Count Users
    ${token}    Pegar Token
    ${resposta}    GET On Session    alias=develop    url=/user/count?token=${token}
    RETURN                     ${resposta.json()}

Get User
    ${token}    Pegar Token
    ${resposta}    GET On Session    alias=develop    url=/user/${id_user}?token=${token}
    Log To Console    ${resposta.json()["_id"]}

Delete User
    ${token}    Pegar Token
    DELETE On Session    alias=develop    url=/user/${id_user}?token=${token}

Put Status False
    ${token}    Pegar Token
    ${body}    Create Dictionary    status=false
    PUT On Session    alias=develop    url=/user/status/${id_user}?token=${token}    json=${body}

Put Status True
    ${token}    Pegar Token
    ${body}    Create Dictionary    status=true
    PUT On Session    alias=develop    url=/user/status/${id_user}?token=${token}    json=${body}
