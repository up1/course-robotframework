*** Settings ***
Library   RequestsLibrary

*** Testcases ***
Post data to httpbin
    Create Session  hb  http://httpbin.org
    &{headers}=  Create Dictionary   
    ...   Content-Type=application/json
    &{data}=  Create Dictionary   name1=somkiat
    ${response}=  
    ...  Post Request  hb  /post
    ...  data=${data}   headers=${headers}
    Should Be Equal	 ${response.status_code}  ${200}
    Log to console   ${response.json()}
    Should Be Equal  
    ...   ${response.json()["json"]["name1"]}  somkiat

Get data from httpbin
    Create Session  hb  http://httpbin.org
    &{param}=  Create Dictionary   
    ...  name1=somkiat   name2=pui
    ${response}=  
    ...  Get Request  hb  /get   params=${param}
    Should Be Equal	 ${response.status_code}  ${200}
    Log to console   ${response.json()}
    Should Be Equal  
    ...   ${response.json()["args"]["name1"]}  somkiat