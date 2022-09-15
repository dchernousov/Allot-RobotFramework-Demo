*** Settings ***
Library  SeleniumLibrary
Variables  locators.py
Variables  ../TestData/testdata.py

*** Keywords ***
Accept All Cookies

    CLick Element  ${AcceptCookieButton}

Click Careers Link
    Wait Until Element Is Visible  ${CareersLink}  timeout=5
    Click Element  ${CareersLink}
