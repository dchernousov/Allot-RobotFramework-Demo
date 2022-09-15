*** Settings ***
Documentation  API Testing in Robot Framework
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library    XML

*** Variables ***

*** Test Cases ***
Do a GET Request and validate the positive response code and responce headers
    [documentation]  This test case verifies that the response code of the GET Request should be 200
    [tags]  Smoke
    Create Session  mysession  https://www.meteoprog.com  verify=true
    ${response}=  GET On Session  mysession  /ru/weather/Kopische/weekend/
    Status Should Be  200  ${response}  #Check Status as 200

    ${contentTypeValue}=    get from dictionary    ${response.headers}  Content-Type
    should be equal    ${contentTypeValue}      text/html; charset=utf-8

    ${contentEncodeValue}=    get from dictionary    ${response.headers}  Content-Encoding
    should be equal    ${contentEncodeValue}      gzip

Do a POST Request and validate the response code, response body, and response headers
    [documentation]  This test case verifies that the response code of the POST Request should be 201,
    ...  the response body contains the 'id' key with value '101',
    ...  and the response header 'Content-Type' has the value 'application/json; charset=utf-8'.
    [tags]  Regression
    Create Session  mysession  https://jsonplaceholder.typicode.com  verify=true
    &{body}=  Create Dictionary  title=foo  body=bar  userId=9000
    &{header}=  Create Dictionary  Cache-Control=no-cache
    ${response}=  POST On Session  mysession  /posts  data=${body}  headers=${header}
    Status Should Be  201  ${response}  #Check Status as 201

    #Check id as 101 from Response Body
    ${id}=  Get Value From Json  ${response.json()}  id
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  101

    #Check the value of the header Content-Type
    ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
    Should be equal  ${getHeaderValue}  application/json; charset=utf-8

Get data from JSON file
    ${json_obj}=     load json from file    Resources/TestData/jsondata.json

    ${name_value}=    get value from json    ${json_obj}      $.firstName
    log to console     ${name_value[0]}
    should be equal    ${name_value[0]}     Dzmitry

    ${street_value}=    get value from json    ${json_obj}      $.address.streetAddress
    log to console    ${street_value[0]}
    should be equal    ${street_value[0]}     Gintovta street

    ${mobileNo_value}=    get value from json    ${json_obj}      $.phoneNumbers[0].number
    log to console    ${mobileNo_value}
    should be equal    ${mobileNo_value[0]}    8-025-706-97-82

Parse data from XML
    ${xml_obj}=     parse xml    Resources/TestData/employees.xml

    # Validations
    # Val1 - Check the single element value
    # Approach 1
    ${emp_firstname}=     get element text    ${xml_obj}    .//employee[1]/firstname
    should be equal    ${emp_firstname}     Dzmitry

    # Approach 2
    ${emp_firstname}=     get element    ${xml_obj}    .//employee[1]/firstname
    should be equal    ${emp_firstname.text}     Dzmitry

    # Approach 3
    element text should be    ${xml_obj}    Dzmitry    .//employee[1]/firstname

    # Val2 - Check number of elements
    ${emp_count}=   get element count    ${xml_obj}     .//employee
    should be equal as integers    ${emp_count}     4

    # Val3 - Check attribute presence
    element attribute should be    ${xml_obj}   id  be129   .//employee[1]
    element attribute should be    ${xml_obj}   id  be132   .//employee[4]

    # Val4 - Check values of child elements
    ${child_elements}=   get child elements    ${xml_obj}    .//employee[1]
    should not be empty    ${child_elements}

    ${fname}=  get element text    ${child_elements[0]}
    ${lname}=  get element text    ${child_elements[1]}
    ${title}=  get element text    ${child_elements[2]}

    log to console    ${fname}
    log to console    ${lname}
    log to console    ${title}

    should be equal    ${fname}     Dzmitry
    should be equal    ${lname}     Charnavusau
    should be equal    ${title}     QA Engineer

*** Keywords ***