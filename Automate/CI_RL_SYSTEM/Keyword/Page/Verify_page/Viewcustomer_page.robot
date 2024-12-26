*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***

INPUT CHECK DROPDOWN AND TEXTAREAR
    [Arguments]    ${group_value}    ${locator_result}    ${locator_comment}    ${locator_sele_dropdown}    ${locator_dropdown}    ${timeout}=10s

    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator_result}    ${timeout}
    BuiltIn.Log    !!START GET->${status}    WARN

    # ถ้าเจอ label
    IF  '${status}' == 'True'
        BuiltIn.Log    !!!Have Result    WARN
        ${result_check}    SeleniumLibrary.Get Text    ${locator_result}
        BuiltIn.Log    !!!GET TEXT RESULT->${result_check}    WARN

        # ถ้ามี text
        IF  '${result_check}' != 'none'
      
            BuiltIn.Log    !!!CHECK COMMENT    WARN
            ${comment_check}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator_comment}    ${timeout}
            BuiltIn.Log    !!!HAVE TEXTAREA->${comment_check}    WARN

            # ถ้ามีช่องคอมเมนต์
            IF  '${comment_check}' == 'True'

                BuiltIn.Log    !!!INPUT DATA AT TEXTAREA    WARN
                SeleniumLibrary.Input Text    ${locator_comment}    ${group_value}
     
            # ถ้าไม่มีช่องคอมเมนต์ 
            ELSE
                BuiltIn.Log    !!!Don't Have Comment    WARN
                BuiltIn.Log    Skip Comment, no textarea    WARN
            END
        END

    # ถ้าไม่เจอ label
    ELSE 
        # ถ้าไม่มี text
        BuiltIn.Log    !!!Don't Have Result    WARN
        BuiltIn.Log    !!!CHECK DROPDOWN    WARN
        ${status_dropdown}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sele_dropdown}    ${timeout}
        BuiltIn.Log    !!!HAVE DROPDOWN->${status_dropdown}    WARN
        
        # ถ้าเจอ dropdown
        IF  '${status_dropdown}' == 'True'
            BuiltIn.Log    !!!SELECT DROPDWON    WARN
            Common_keyword.SELECT OPTION BY LABEL NAME    ${locator_sele_dropdown}    ${group_value}    ${locator_dropdown}
        
        # ถ้าไม่เจอ dropdown
        ELSE
            BuiltIn.Log    Skip Result, no dropdown    WARN
            BuiltIn.Log    !!!CHECK COMMENT    WARN
            ${comment_check}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator_comment}    ${timeout}
            BuiltIn.Log    !!!HAVE TEXTAREA->${comment_check}    WARN

            # ถ้ามีช่องคอมเมนต์
            IF  '${comment_check}' == 'True'
                BuiltIn.Log    !!!INPUT DATA AT TEXTAREA    WARN
                SeleniumLibrary.Input Text    ${locator_comment}    ${group_value}
        
            # ถ้าไม่มีช่องคอมเมนต์ 
            ELSE
                BuiltIn.Log    !!!Don't Have Comment    WARN
                BuiltIn.Log    Skip Comment, no textarea    WARN
            END
            
        END
    END
    BuiltIn.Log    ------------------------------------    WARN


VIEWCUSTOMER - INPUT E1
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   10x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${table_collapseViewCust}    10s
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR    ${group_value}[0][INT_ViewCustomer_E1]    ${Locator_result_Viewcus_E1}    ${Locator_comment_Viewcus_E1}    ${Locator_Select_dd_Viewcus_E1}    ${Dropdown_Viewcus_E1}


VIEWCUSTOMER - INPUT E2
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E2]    ${Locator_result_Viewcus_E2}    ${Locator_comment_Viewcus_E2}    ${Locator_Select_dd_Viewcus_E2}    ${Dropdown_Viewcus_E2}


VIEWCUSTOMER - INPUT E3
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E3]    ${Locator_result_Viewcus_E3}    ${Locator_comment_Viewcus_E3}    ${Locator_Select_dd_Viewcus_E3}    ${Dropdown_Viewcus_E3}


VIEWCUSTOMER - INPUT E4
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E4]    ${Locator_result_Viewcus_E4}    ${Locator_comment_Viewcus_E4}    ${Locator_Select_dd_Viewcus_E4}    ${Dropdown_Viewcus_E4}


VIEWCUSTOMER - INPUT E5
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E5]    ${Locator_result_Viewcus_E5}    ${Locator_comment_Viewcus_E5}    ${Locator_Select_dd_Viewcus_E5}    ${Dropdown_Viewcus_E5}


VIEWCUSTOMER - INPUT E6
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E6]    ${Locator_result_Viewcus_E6}    ${Locator_comment_Viewcus_E6}    ${Locator_Select_dd_Viewcus_E6}    ${Dropdown_Viewcus_E6}


VIEWCUSTOMER - INPUT E7
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E7]    ${Locator_result_Viewcus_E7}    ${Locator_comment_Viewcus_E7}    ${Locator_Select_dd_Viewcus_E7}    ${Dropdown_Viewcus_E7}


VIEWCUSTOMER - SELECT DROPDOWN E8
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E8]    ${Locator_result_Viewcus_E8}    ${Locator_comment_Viewcus_E8}    ${Locator_Select_dd_Viewcus_E8}    ${Dropdown_Viewcus_E8}


VIEWCUSTOMER - SELECT DROPDOWN E9
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E9]    ${Locator_result_Viewcus_E9}    ${Locator_comment_Viewcus_E9}    ${Locator_Select_dd_Viewcus_E9}    ${Dropdown_Viewcus_E9}


VIEWCUSTOMER - INPUT E10
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E10]    ${Locator_result_Viewcus_E10}    ${Locator_comment_Viewcus_E10}    ${Locator_Select_dd_Viewcus_E10}    ${Dropdown_Viewcus_E10}


VIEWCUSTOMER - SELECT DROPDOWN E11
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    INPUT CHECK DROPDOWN AND TEXTAREAR     ${group_value}[0][INT_ViewCustomer_E11]    ${Locator_result_Viewcus_E11}    ${Locator_comment_Viewcus_E11}    ${Locator_Select_dd_Viewcus_E11}    ${Dropdown_Viewcus_E11}



VIEWCUSTOMER - CLICK BUTTON CONFIRM VIEWCUSTOMER
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Viewcus_Confirm}    10s
    SeleniumLibrary.Click Element    ${Locator_Verify_Viewcus_Confirm}


