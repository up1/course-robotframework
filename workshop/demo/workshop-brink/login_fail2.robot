*** Settings ***
Library    Selenium2Library
Resource   pages/login.robot
Resource   pages/error.robot

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
  login.กรอกข้อมูล   ${username}   ${password}
  login.กดปุ่ม login
  error.แสดงหน้า Error

ไปยังหน้า login
  Go to   ${LOGIN URL}

เปิดหน้า login
  Open Browser    ${LOGIN URL}   browser=gc
