*** Settings ***
Library    CSVLibrary.py

*** Testcases ***
Read file from csv
    ${all users}=    Read CSV File    sample.csv
    :FOR  ${user}   in   @{all users}
    \    Log   @{user}[0] - @{user}[1]
