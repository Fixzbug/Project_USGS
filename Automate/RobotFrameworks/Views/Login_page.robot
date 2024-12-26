*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot  # robotcode: ignore

*** Keywords ***
 
LOGIN PAGE - OPEN INRANET
    [Arguments]    ${URL}    ${Browser}    ${Mode}
    Common_keyword.OPEN INTRANET     ${URL}    ${Browser}    ${Mode}


LOGIN PAGE - SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}
    

    # Username
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${username_locator}    60s
    Common_keyword.INPUT TEXT    ${username_locator}    ${username}

    # Password
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${password_locator}    60s
    Common_keyword.INPUT PASSWORD    ${password_locator}    ${password}  
        
    # Click login button
    CaptureScreen_controller.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN - USER
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${login_locator}
    Common_keyword.CLICK BUTTON BY LOCATOR   ${login_locator}



LOGIN PAGE - SETTING LOGIN BY DATA
    [Arguments]    ${system_name}

    # Username
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${username_locator}    60s
    Common_keyword.INPUT TEXT    ${username_locator}   ${group_data}[Username]

    # Password
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${password_locator}    60s
    Common_keyword.INPUT PASSWORD   ${password_locator}    ${group_data}[Password]
        
    # Click login button
    CaptureScreen_controller.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN - USER
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${login_locator}
    Common_keyword.CLICK BUTTON BY LOCATOR   ${login_locator}
    


LOGIN PAGE - MENU
    Common_keyword.CLICK BUTTON BY LOCATOR    sdfsdf


LOGIN PAGE - VERIFY
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_locator}    60s



LOGIN PAGE - LOGOUT
    Common_keyword.CLICK LINK    ${login_locator}





