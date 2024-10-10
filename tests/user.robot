*** Settings ***
Resource    ../resources/users.robot

*** Test Cases ***
Criar usuário com sucesso
    [Tags]    User
    Cadastro Sucesso

Pegar um usuário por ID
    ${user_ID}    Create User
    Get User    ${user_ID}


Listagem de usuários com sucesso
    [Tags]    Smoke
    ${list_users}    List Users
    # Log To Console    ${list_users}
    Should Be String     ${list_users[0]['_id']}
    Should Not Be Empty    ${list_users}

Contagem de usuários com sucesso
    [Tags]    Smoke
    ${count_users}    Count Users
    Should Not Be Empty    ${count_users}

Atualizar Status para False
    [Tags]    Status
    ${user_ID}    Create User
    ${resposta}    Put Status    ${user_ID}    status=false
    # Log To Console    message=${resposta["msg"]}
    Should Be Equal    Status do usuario atualizado com sucesso para status false.    ${resposta["msg"]}
    Delete User    id_user=${user_ID}

Atualizar Status para True
    [Tags]    Status
    ${user_ID}    Create User
    ${resposta}    Put Status    ${user_ID}    status=true
    Should Be String    msg=Status do usuario atualizado com sucesso para status true.    item=${resposta["msg"]}
    # Log To Console    message=${resposta["msg"]}
    Delete User    id_user=${user_ID}

