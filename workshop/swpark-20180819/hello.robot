*** Settings ***
Library  SeleniumLibrary
Test Teardown  Close Browser

*** Variables ***

*** Testcases ***
Search by robot
  [Tags]  done
  เปิด browser ไปที่ google thailand
  ใส่ค่า robot
  กดค้นหา
#   ต้องเจอ Wikipedia ของ Robot

Search by xyz
  [Tags]  testing
  เปิด browser ไปที่ google thailand
  ใส่ค่า xyz
  กดค้นหา
#   ต้องเจอ Wikipedia ของ Robot

*** Keywords ***
ต้องเจอ Wikipedia ของ Robot
  SeleniumLibrary.Capture Page Screenshot
  Wait Until Element Contains   
  ...  xpath://*[@id="rso"]/div[1]/div/div/div/h3
  ...  Robot - Wikipedia
  Click Element  
  ...  xpath://*[@id="rso"]/div[1]/div/div/div/h3/a
  SeleniumLibrary.Capture Page Screenshot
  Location Should Be   https://en.wikipedia.org/wiki/Robot
  SeleniumLibrary.Capture Page Screenshot

กดค้นหา
  Press Key  name:q  \\13

ใส่ค่า robot
  Input Text  name:q  robot
  SeleniumLibrary.Capture Page Screenshot

เปิด browser ไปที่ google thailand
  SeleniumLibrary.Open Browser  https://www.google.co.th  browser=gc 
  SeleniumLibrary.Capture Page Screenshot
  
