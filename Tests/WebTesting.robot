*** Settings ***
Documentation  Page Object in Robot Framework
Library  SeleniumLibrary
Resource  ../Resources/PageObject/CareersPage.robot
Resource  ../Resources/PageObject/HomePage.robot
Resource  ../Resources/PageObject/Common.robot

*** Variables ***
${site_url}  https://www.allot.com/
${browser}  Firefox

*** Test Cases ***
Verify Successful Opening of Allot web-site
    [documentation]  This test case verifies that the Careers page can be opend at Allot web-site
    [tags]  Smoke
    Opening Browser  ${site_url}  ${browser}
    Click Careers Link
    Verify Carrers Page
    [Teardown]    Close Browser

*** Keywords ***