*** Settings ***
Library   Selenium2Library

*** Testcases ***
Upload 1 ไฟล์
  เปิดหน้า upload file
  เลือกไฟล์   somkiat.jpg
  ข้อมูลไฟล์ต้องมีใน Upload queue 1 ไฟล์
  ทำการ upload file
  Queue progress ต้องแสดง 100%

Upload 2 ไฟล์
  [Tags]   testing
  เปิดหน้า upload file
  เลือกไฟล์   somkiat.jpg
  เลือกไฟล์   somkiat2.jpg
  ข้อมูลไฟล์ต้องมีใน Upload queue 2 ไฟล์
  ทำการ upload file
  Queue progress ต้องแสดง   100%

ตรวจสอบหน้าหลักของการ upload file
  เปิดหน้า upload file
  ต้องมี Select files ทางด้านซ้าย
  # ต้องมี Upload queue ทางด้านขวา
  Queue progress ต้องแสดง   0%
  ต้องมี 3 ปุ่มที่กดไม่ได้คือ Upload all, Cancel all และ Remove all

*** Keywords ***
ทำการ upload file
  Click Element
  ...   xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

ข้อมูลไฟล์ต้องมีใน Upload queue 2 ไฟล์
  Xpath Should Match X Times
  ...  //table/tbody/tr
  ...  2

ข้อมูลไฟล์ต้องมีใน Upload queue 1 ไฟล์
  Xpath Should Match X Times
  ...  //table/tbody/tr
  ...  1

เลือกไฟล์
  [Arguments]   ${filename}
  Choose File
  ...   xpath=//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
  ...   /Users/somkiat/data/slide/robot-framework/workshop-brink/${filename}

Queue progress ต้องแสดง
  [Arguments]   ${percent}
  Wait Until Page Contains Element
  ...  xpath=//div[@class="progress"]/div[@style="width: ${percent};"]

ต้องมี 3 ปุ่มที่กดไม่ได้คือ Upload all, Cancel all และ Remove all
  Wait Until Page Contains Element   xpath=//div/button[1]
  Element Should Be Disabled   xpath=//div/button[1]

  Xpath Should Match X Times
  ...  //div/button
  ...  3

ต้องมี Select files ทางด้านซ้าย
  Wait Until Page Contains Element
  ...  xpath=//div[@class="col-md-3"]/h3

  Wait Until Element Contains
  ...  xpath=//div[@class="col-md-3"]/h3
  ...  Select files

เปิดหน้า upload file
  Open Browser
  ...   http://nervgh.github.io/pages/angular-file-upload/examples/simple/
  ...   browser=gc
