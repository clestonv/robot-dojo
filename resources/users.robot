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
    ${person}    Get Fake Person
    ${token}    Pegar Token
    ${body}    Create Dictionary
    ...    fullName=${person}[name]    
    ...    mail=${person}[email]
    ...    password=1234@Test
    ...    accessProfile=ADMIN
    ...    cpf=${person}[cpf]
    ...    confirmPassword=1234@Test
    ${resposta}    POST On Session    alias=develop    url=/user/?token=${token}    json=${body}
    Status Should Be    201    ${resposta}
    RETURN    ${resposta.json()["user"]["_id"]}

Count Users
    ${token}    Pegar Token
    ${resposta}    GET On Session    alias=develop    url=/user/count?token=${token}
    RETURN                     ${resposta.json()}

Get User    
    [Arguments]    ${id_user}
    ${token}    Pegar Token
    ${resposta}    GET On Session    alias=develop    url=/user/${id_user}?token=${token}
    # Log To Console    ${resposta.json()["_id"]}

Delete User
    [Arguments]    ${id_user}
    ${token}    Pegar Token
    DELETE On Session    alias=develop    url=/user/${id_user}?token=${token}

Put Status
    [Arguments]    ${id_user}    ${status}
    ${token}    Pegar Token
    ${body}    Create Dictionary    status=${status}
    ${resposta}    PUT On Session    alias=develop    url=/user/status/${id_user}?token=${token}    json=${body}
    RETURN                     ${resposta.json()}

# Put Status True
#     ${token}    Pegar Token
#     ${body}    Create Dictionary    status=true
#     PUT On Session    alias=develop    url=/user/status/${id_user}?token=${token}    json=${body}

Cadastro Sucesso
    ${user_ID}    Create User
    Get User    ${user_ID}
    Delete User    id_user=${user_ID}