*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot    # robotcode: ignore


*** Variables ***


*** Keywords ***

INPUT ID NUMBER PENDING PORCESS
    [Arguments]    ${ID_no}
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_ID_no_pending_process_locator}    ${ID_no}    


CLICK BUTTON SEARCH PENDING PORCESS
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_search_pending_process_locator}    timeout=60s


CLICK BUTTON REJECT PENDING PORCESS
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_reject_pending_process_locator}    timeout=60s


CLICK BUTTON CANCEL PENDING PORCESS
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_cancel_pending_process_locator}    timeout=60s


CLICK BUTTON SAVE NOTE REJECT PENDING PORCESS
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_save_note_reject_pending_process_locator}    timeout=60s    


CLICK BUTTON OK SEND SMS REJECT PENDING PORCESS
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_ok_send_sms_reject_pending_process_locator}    timeout=60s


SELECT DROPDOW RESULT REJECT PENDING PORCESS
    [Arguments]    ${data_result_reject}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${dropdown_result_reject_pending_process_locator}    ${data_result_reject}    ${for_replace_data_result_reject_pending_process_locator}
        
        
INPUT DESCIPTION REJECT PENDING PORCESS
    [Arguments]    ${data_desciption}
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_desciption_reject_pending_process_locator}    ${data_desciption}