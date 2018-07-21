*** Settings ***
Library  SeleniumLibrary
Test Setup   เปิด browser ไปที่ google thailand
Test Teardown  Close Browser

*** Variables ***
${BROWSER}  chrome

*** Testcases ***
Search by robot
  [Template]  Search template
  #----------------------------#
  #  Input   | Expected result #
  #----------------------------#
     robot          robot
     xyz            xyz
     robot          robot

*** Keywords ***
Search template
  [Arguments]   ${keyword}   ${expected}
  ใส่ค่า   ${keyword}
  กดค้นหา
  Go To   https://www.google.co.th

ใส่ค่า
  [Arguments]  ${keyword}
  Input Text  name:q  ${keyword}
  SeleniumLibrary.Capture Page Screenshot


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

เปิด browser ไปที่ google thailand
  SeleniumLibrary.Open Browser  https://www.google.co.th  browser=${BROWSER}
  SeleniumLibrary.Capture Page Screenshot
  
