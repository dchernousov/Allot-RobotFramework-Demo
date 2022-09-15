*** Settings ***
Library  SeleniumLibrary
Variables  locators.py
Variables  ../TestData/testdata.py

*** Keywords ***
Opening Browser
    [Arguments]  ${site_url}  ${browser}
    Open Browser  ${site_url}  ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible  ${HomePage}  timeout=5