*** Settings ***
Library   String

*** Testcases ***
Split date 10/12/2017
  @{words}=	Split String	08/12/2017	 \/
  Log to console    @{words}[0]
  ${temp}=   Convert to integer  @{words}[0]
  Log to console    ${temp}
  Log to console    @{words}[1]
  Log to console    @{words}[2]
