*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot   # robotcode: ignore  
Suite Setup    Excel_Reader_model.GET - DATA FROM EXCEL BY SHEET    ${excel_file}[Userlogin]    User        
Test Setup    Common_Controller.SET - FORMAT DATA FORM EXCEL    System    Login        
Test Teardown    Common_keyword.CLOSE BROWSER


*** Test Cases *** 

TC001 - LOGIN PAGE     
    [Tags]    TC001

    Login_page.LOGIN PAGE - OPEN INRANET    URL=${URL}    Browser=${BrowserChrome}    Mode=headless=True
    Login_page.LOGIN PAGE - SETTING LOGIN    system_name=TEST    username=tomsmith    password=SuperSecretPassword!


TC002 - LOGIN PAGE     
    [Tags]    TC002

    Login_page.LOGIN PAGE - OPEN INRANET    URL=https://the-internet.herokuapp.com/login    Browser=Chrome    Mode=headless=True
    Login_page.LOGIN PAGE - SETTING LOGIN BY DATA    system_name=TEST


TC003 - LOGIN PAGE     
    [Tags]    TC003

    Login_page.LOGIN PAGE - OPEN INRANET    URL=https://the-internet.herokuapp.com/login    Browser=Chrome    Mode=headless=True
    Login_page.LOGIN PAGE - SETTING LOGIN BY DATA    system_name=TEST
    Login_page.LOGIN PAGE - VERIFY
    Login_page.LOGIN PAGE - LOGOUT


TC003 - LOGIN PAGE     
    [Tags]    TC004

    Login_page.LOGIN PAGE - OPEN INRANET    URL=https://the-internet.herokuapp.com/login    Browser=Chrome    Mode=headless=True
    Login_page.LOGIN PAGE - SETTING LOGIN BY DATA    system_name=TEST
    Login_page.LOGIN PAGE - VERIFY
    Login_page.LOGIN PAGE - MENU
    Login_page.LOGIN PAGE - LOGOUT


