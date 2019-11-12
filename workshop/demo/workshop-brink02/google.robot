*** Settings ***
Library  Selenium2Library
Test Teardown   Close Browser

*** Variables ***
${BASE_URL}   https://www.google.co.th

*** Testcases ***
Find robot-wikipedia in google
  Go to google.com
  Search    robot
  Find text    Robot - Wikipedia

Find หวย in google 2
  [Tags]  test
  Go to google.com
  Search    หวย
  Find text    ตรวจสลากกินแบ่งรัฐบาล

*** Keywords ***
Search
  [Arguments]  ${word}
  Input Text   name=q   ${word}
  Press Key   name=q   \\13

Find text
  [Arguments]    ${expected_result}
  Page Should Contain   ${expected_result}
  # Wait Until Element Contains   xpath=//*[@id="rso"]/div[1]/div/div[2]/div/div/h3/a  Robot${SPACE}- Wikipedia


Go to google.com
  Open Browser   ${BASE_URL}  browser=gc
  Maximize Browser Window
  Capture Page Screenshot
