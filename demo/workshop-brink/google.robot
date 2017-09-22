*** Settings ***
Library    Selenium2Library

*** Variables ***

*** Testcases ***
หาแฟนผ่าน google
  เปิด browser ไปที่ google
  ใส่คำว่า หาแฟน
  ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx
  [Teardown]   Close Browser

หาแฟนผ่าน google 2
  [Tags]   testing
  เปิด browser ไปที่ google
  ใส่คำว่า หาแฟน
  ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx
  [Teardown]   Close Browser

หาแฟนผ่าน google 3
  [Tags]   testing
  เปิด browser ไปที่ google
  ใส่คำว่า หาแฟน
  ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx
  [Teardown]   Close Browser

*** Keywords ***
ใส่คำว่า หาแฟน
  Input Text   name=q   หาแฟน
  Press Key   name=q   \\13

ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx
  Page Should Contain    www.houseoflover.com/hol/home/friendfind.aspx

เปิด browser ไปที่ google
  Open Browser   http://www.google.com  browser=gc
