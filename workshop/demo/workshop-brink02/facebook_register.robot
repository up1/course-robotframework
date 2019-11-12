*** Settings ***
Library   Selenium2Library

*** Testcases ***
Password too short
  Go to registration page
  Fill in name
  Fill in email
  Fill in password
  Choose birthdate
  Choose gender
  Register
  Should show error message with password too short

*** Keywords ***
Should show error message with password too short
  Wait Until Element Is Visible   id=reg_error_inner
  Wait Until Element Contains   id=reg_error_inner   โปรดเลือกรหัสผ่านที่ปลอดภัยกว่านี้ รหัสผ่านควรมีความยาว 6 อักขระขึ้นไป และเป็นรหัสที่คุณจดจำได้ง่ายแต่คนอื่นคาดเดาได้ยาก

Register
  # Click Element   name=websubmit
  Click Button   name=websubmit

Choose gender
  Select Radio Button   sex   2
  Click Element    id=u_0_7
  Click Element    xpath=//*[@id="u_0_7"]

Choose birthdate
  Select From List By Value   name=birthday_day   10
  Select From List By Value   name=birthday_month   12
  Select From List By Value   name=birthday_year   1981

Fill in password
  Input Text   name=reg_passwd__   12345678

Fill in email
  Input Text   name=reg_email__    somkiat.p@gmail.com
  Input Text   name=reg_email_confirmation__    somkiat.p@gmail.com

Fill in name
  Input Text   name=firstname   Somkiat
  Input Text   name=lastname   Puisungnoen

Go to registration page
  Open Browser    https://www.facebook.com   browser=chrome
  Maximize Browser Window
