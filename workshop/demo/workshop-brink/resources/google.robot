*** Settings ***
Library    Selenium2Library

*** Variables ***
${URL}    http://www.google.com

*** Keywords ***
ไปหน้าแรก
  Go To   ${URL}

ใส่คำว่า หาแฟน
  Input Text   name=q   หาแฟน
  Press Key   name=q   \\13

ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx
  Page Should Contain    www.houseoflover.com/hol/home/friendfind.aspx

เปิด browser ไปที่ google
  Open Browser   ${URL}  browser=gc
