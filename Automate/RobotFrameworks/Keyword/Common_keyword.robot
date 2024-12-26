*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore


*** Keywords ***

OPEN INTRANET
    [Arguments]    ${URL}    ${Browser}    ${Mode}=headless=True
    SeleniumLibrary.Open Browser    ${URL}    ${Browser}    ${Mode}


MAXIMIZE BROWSER WINDOW
    SeleniumLibrary.Maximize Browser Window


DELETE ALL COOKIES
    SeleniumLibrary.Delete All Cookies


CLOSE BROWSER
    SeleniumLibrary.Close Browser


#  ************************ INPUT

INPUT TEXT
    [Arguments]    ${locator}    ${data}
    SeleniumLibrary.Input Text    ${locator}    ${data}


INPUT PASSWORD
    [Arguments]    ${locator}    ${data}
    SeleniumLibrary.Input Password    ${locator}    ${data}

#  ************************ INPUT
#  ************************ CLICK

CLICK ELEMENT BY LOCATOR
    [Arguments]    ${locator}
    SeleniumLibrary.Click Element    ${locator}


CLICK BUTTON BY LOCATOR
    [Arguments]    ${locator}
    SeleniumLibrary.Click Element    ${locator}


CLICK ELEMENT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    SeleniumLibrary.Click Element    ${locator}


CLICK BUTTON WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    SeleniumLibrary.Click Element    ${locator}


CLICK LINK
    [Arguments]    ${locator}
    SeleniumLibrary.Click Link    ${locator}

#  ************************ CLICK

RUN KEYWORD AND IGNORE ERROR
    [Arguments]    ${keyword}
    BuiltIn.Run keyword and ignore error    ${keyword}



WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR 
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}