*** Settings ***
Library  Selenium2Library
Test Teardown   Close Browser

*** Testcases ***
Upload single file with upload
  [Tags]  done
  Go to upload file page
  Select a file  sample_01.jpg
  Should have files in table  1
  Upload
  Should success

Upload 2 files with upload all
  [Tags]  test
  Go to upload file page
  Select a file   sample_01.jpg
  Select a file   sample_02.jpg
  Should have files in table   2
  Upload all
  Should success

*** Keywords ***
Should success
  Wait Until Page Contains Element   xpath=//div[@style="width: 100%;"]

Upload all
  Wait Until Element Is Enabled   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]
  Click Element   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

Upload
  Wait Until Element Is Enabled   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[5]/button[1]
  Click Element   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[5]/button[1]

Should have files in table
  [Arguments]   ${number of file}
  Xpath Should Match X Times   //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr  ${number of file}

Select a file
  [Arguments]   ${filename}
  Choose File   xpath=//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]  /Users/somkiat/data/slide/robot-framework/workshop-brink02/${filename}
  # Xpath Should Match X Times   //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr  ${number of file}
  # Wait Until Element Contains   xpath=//table/tbody/tr/td[1]   sample_01.jpg
  # Wait Until Element Contains   xpath=//table/tbody/tr/td[2]   0.12 MB
  # Element Should Be Enabled   xpath=//table/tbody/tr/td[5]/button[1]
  # Element Should Be Disabled  xpath=//table/tbody/tr/td[5]/button[2]
  # Element Should Be Enabled   xpath=//table/tbody/tr/td[5]/button[3]


Go to upload file page
  Open Browser    http://nervgh.github.io/pages/angular-file-upload/examples/simple/   browser=chrome
  Wait Until Element Is Enabled   xpath=//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
