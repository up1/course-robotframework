*** Keywords ***
กรอกข้อมูล
  [Arguments]   ${username}    ${password}
  Input Text   username_field  ${username}
  Input Text   username_field  ${password}

กดปุ่ม login
  Click Button    LOGIN
