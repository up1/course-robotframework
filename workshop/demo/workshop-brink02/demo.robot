*** Variables ***
${URL}    my url
${ACTION}   my action

*** Testcases ***
Test Concat
  Log to console   ${URL}-${ACTION}
