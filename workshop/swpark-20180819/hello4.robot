*** Settings ***
Resource   google/keyword.robot
Test Setup   เปิด browser ไปที่ google thailand
Test Teardown  Close Browser
Test Template  Search template

*** Testcases ***
#-------------------------------------#
# TC Name | Input   | Expected result #
#-------------------------------------#
TC01        robot          robot
TC02        xyz            xyz
TC03        robot          robot

*** Keywords ***
Search template
  [Arguments]   ${keyword}   ${expected}
  ใส่ค่า   ${keyword}
  กดค้นหา
  Go To   https://www.google.co.th