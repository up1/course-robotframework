*** Settings ***
Library   Collections
Library   RequestsLibrary

*** Testcases ***
Try to test
  [Tags]   dev
  Create Session   local  http://localhost:8882
  ${response}=	Get Request	 local  /v1/customer/1
  ${json}=   Set Variable  ${response.json()}

  Should Be Equal As Strings   200   ${response.status_code}
  Should Be Equal As Strings   somkiat   ${json["names"][0]}
  Should Be Equal As Strings   pui   ${json["names"][1]}
  Should Be Equal As Strings   spns   ${json["names"][2]}


Get API
  Create Session   httpbin   http://httpbin.org
  ${response}=	Get Request	 httpbin  /get
  Log to console   ${response}
  Log to console   ${response.status_code}
  Log to console   ${response.json()}
  ${json}=   Set Variable  ${response.json()}

  Should Be Equal As Strings   200   ${response.status_code}
  Should Be Equal As Strings   125.25.106.216   ${json["origin"]}

Get API with parameter name=somkiat
  [Tags]   test
  Create Session   httpbin   http://httpbin.org
  &{names}=  Create List   somkiat  pui  spns
  &{params}=  Create Dictionary   name=${names}
  ${response}=	Get Request	 httpbin  /get   params=${params}
  ${json}=   Set Variable  ${response.json()}

  Should Be Equal As Strings   200   ${response.status_code}
  Should Be Equal As Strings   somkiat   ${json["args"]["name"]}
