*** Settings ***
Resource   resources/google.robot
Suite Setup    เปิด browser ไปที่ google
Suite Teardown    Close Browser
Test Teardown    ไปหน้าแรก

*** Testcases ***
หาแฟนผ่าน google
  ใส่คำว่า หาแฟน
  ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx

หาแฟนผ่าน google 2
  ใส่คำว่า หาแฟน
  ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx

หาแฟนผ่าน google 3
  ใส่คำว่า หาแฟน
  ต้องเจอ url www.houseoflover.com/hol/home/friendfind.aspx
