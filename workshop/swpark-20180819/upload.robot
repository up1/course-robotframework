*** Settings ***
Library   SeleniumLibrary

*** Variables ***

*** Testcases ***
Upload single file
    เปิด browser ไปที่หน้าหลัก
    เลือกไฟล์  file01.png
    Upload file  1
    ต้อง Upload สำเร็จนะ

Upload two file
    [Tags]  testing
    เปิด browser ไปที่หน้าหลัก
    เลือกไฟล์    file01.png
    เลือกไฟล์    file02.png
    Upload file  1
    Upload file  2
    ต้อง Upload สำเร็จนะ

*** Keywords ***
Upload file
    [Arguments]  ${row number}
    Click Element
    ...  xpath://table/tbody/tr[${row number}]/td[5]/button[1]

เลือกไฟล์
    [Arguments]  ${file name}
    SeleniumLibrary.Choose File   
    ...   xpath://div[2]/div[1]/input[2]
    ...   ${CURDIR}/images/${file name}
    Clear Element Text   xpath://div[2]/div[1]/input[2]

ต้อง Upload สำเร็จนะ
    Wait Until Page Contains Element
    ...  xpath://div[@style="width: 100%;"]

เปิด browser ไปที่หน้าหลัก
    Open Browser   
    ...  http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...  browser=firefox
