*** Settings ***
Library  Selenium2Library
Test Teardown   Close Browser

*** Testcases ***
Names on Facebook can't contain a large number of repeating characters
  ไปที่หน้าแรกของ facebook
  กรอกข้อมูลส่วนตัวของ Somkiat
  สร้าง account ใหม่
  แสดง error message

*** Keywords ***
แสดง error message
  Wait Until Element Contains   id=reg_error_inner   ชื่อบน${SPACE*1}Facebook ไม่สามารถมีอักขระที่ซ้ำกันเป็นจำนวนมากได้

สร้าง account ใหม่
  Click Element   name=websubmit

กรอกข้อมูลส่วนตัวของ Somkiat
  Input Text   name=firstname    Somkiat
  Input Text   name=lastname    ddd
  Input Text   name=reg_email__   0868696209
  Input Text   name=reg_passwd__  1kdkrfmDsdfj
  กรอกข้อมูลวันเดือนปีเกิด  10   12  1981
  Select Radio Button   sex  2

กรอกข้อมูลวันเดือนปีเกิด
  [Arguments]   ${day}   ${month}   ${year}
  Select From List By Value   name=birthday_day    ${day}
  Select From List By Value   name=birthday_month    ${month}
  Select From List By Value   name=birthday_year    ${year}

ไปที่หน้าแรกของ facebook
  Open Browser    http://www.facebook.com   browser=gc
