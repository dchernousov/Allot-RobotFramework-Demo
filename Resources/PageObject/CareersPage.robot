*** Settings ***
Library  SeleniumLibrary
Variables  locators.py
Variables  ../TestData/testdata.py

*** Keywords ***
Verify Carrers Page
    Element Should Be Visible  ${WelcomeText}  timeout=5