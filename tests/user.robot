*** Settings ***
Resource    ../resources/users.robot

*** Test Cases ***
Criar usuário com sucesso
    Log To Console    message=Sucesso User

Pegar um usuário por ID
    Log To Console    message=Sucesso ID


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


