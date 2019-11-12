*** Settings ***
Library    CSVLibrary.py

*** Testcases ***
Read file from csv
    [Template]    demo of datas from csv
    [Setup]    prepare data
    :FOR  ${user}   in   @{all users}
    \    @{user}[0]     @{user}[1]


*** Keywords ***
prepare data
    ${all users}=    Read CSV File    sample.csv
    Set Test Variable   ${all users}     ${all users}

Demo of datas from csv
    [Arguments]    ${username}    ${password}
    Log    ${username} - ${password}
