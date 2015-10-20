*** Settings ***
Library                 Selenium2Library
Library    Collections
Library    CSVLibrary.py
Test Setup          Open login page
Test Teardown    Close Browser

*** Testcases ***
Rule of login failure
    [Template]   Flow of login failure
    :FOR  ${user}   in   @{all users}
    \    @{user}[0]     @{user}[1]

*** Keywords ***
Flow of login failure
    [Arguments]    ${username}    ${password}
    Fill in information    ${username}    ${password}
    Login to system
    I will see Error page
    Go To    http://localhost:7272/html/

Prepare data
    ${all users}=    read_csv_file    sample.csv
    Set Test Variable   ${all users}     ${all users}

Open login page
    Prepare data
    Open Browser    http://localhost:7272/html/

Fill in information
     [Arguments]    ${username}    ${password}
     Input Text    username_field    ${username}
     Input Text    password_field    ${password}

Login to system
    Click Button    LOGIN

I will see Error page
    Wait Until Page Contains    Error Page












