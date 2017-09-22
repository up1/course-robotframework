*** Settings ***
Library    Selenium2Library
Suite Setup  เปิดหน้า login
Suite Teardown   Close Browser
Test Setup   ไปยังหน้า login
Test Template   Flow of Login fail

*** Variables ***
${LOGIN URL}   http://localhost:7272/

*** Testcases ***  Username    Password
User Name ผิด        demo1       mode
Password ผิด         demo        mode1
ผิดทั้งคู่               demo1       mode1
User Name ว่าง       ${EMPTY}    mode

*** Keywords ***
Flow of Login fail
  [Arguments]   ${username}    ${password}
  ทำการกรอกข้อมูล   ${username}   ${password}
  แสดงหน้า Error

แสดงหน้า Error
  Wait Until Page Contains    Error Page

ทำการกรอกข้อมูล
  [Arguments]   ${username}    ${password}
  Input Text   username_field  ${username}
  Input Text   username_field  ${password}
  Click Button    LOGIN

ไปยังหน้า login
  Go to   ${LOGIN URL}

เปิดหน้า login
  Open Browser    ${LOGIN URL}   browser=gc
