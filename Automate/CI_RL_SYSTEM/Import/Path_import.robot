*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    DebugLibrary
Library    ${CURDIR}/../Resources/Library/reader.py

# locator
Resource    ${CURDIR}/../Locator/Common_locator.robot
Resource    ${CURDIR}/../Locator/Interview_locator/Key_in_step_1_locator/Key_in_step_1_locator.robot
Resource    ${CURDIR}/../Locator/Interview_locator/Manage_application_online_locator/Manage_aplication_online_locator.robot
Resource    ${CURDIR}/../Locator/Recheck_Key_in_step_1_locator/Recheck_Key_in_step_1_locator.robot
Resource    ${CURDIR}/../Locator/Key_in_step_2_locator/Key_in_step_2_locator.robot
Resource    ${CURDIR}/../Locator/Verify_locator/Viewcustomer_locator.robot
Resource    ${CURDIR}/../Locator/Verify_locator/Verify_call_locator.robot
Resource    ${CURDIR}/../Locator/Verify_locator/Verify_Judment_locator.robot
Resource    ${CURDIR}/../Locator/Verify_locator/Judment_approve_locator.robot
Resource    ${CURDIR}/../Locator/Kessai_locator/Kessai_verify_call_locator.robot
Resource    ${CURDIR}/../Locator/Changepriority_locator/Changepriority_locator.robot
Resource    ${CURDIR}/../Locator/Inquiry_application_locator/Inquiry_application_locator.robot
Resource    ${CURDIR}/../Locator/Setting_locator/Delete_application_on_allowcate_locator/Delete_application_on_allowcate_locator.robot
Resource    ${CURDIR}/../Locator/Setting_locator/Control_check_id_card_with_DOPA_locator/Control_check_id_card_with_DOPA_locator.robot
Resource    ${CURDIR}/../Locator/Interview_locator/Pending_process_locator/Pending_process_locator.robot

# Keyword
Resource    ${CURDIR}/../Keyword/Common_keyword.robot    # robotcode: ignore   
Resource    ${CURDIR}/../Keyword/Excel_reader/reader.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Sync_sheet_excel.robot    # robotcode: ignore

# page
Resource    ${CURDIR}/../Keyword/Page/Login_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Capture_screen.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Home_menu_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Interview_page/Key_in_step_1_page/Key_in_step_1_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Interview_page/Manage_application_online_page/Manage_application_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Recheck_Key_in_step_1_page/Recheck_key_in_step_1_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Key_in_step_2_page/Key_in_step_2_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Verify_page/Viewcustomer_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Verify_page/Verify_call_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Verify_page/Verify_judment_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Verify_page/Judment_approve_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Kessai_page/Kessai_judment_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Kessai_page/Kessai_judment_approve_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Kessai_page/Kessai_verify_call_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/CHANGEPRIORITY_page/Changepriority_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Inquiry_application_page/Inquiry_application_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Setting_page/Delete_application_on_allowcate_page/Delete_application_on_allowcate_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Setting_page/Control_check_ID_card_with_DOPA_page/Control_check_id_card_with_DOPA_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Interview_page/Pending_process_page/Pending_process_page.robot    # robotcode: ignore

# feature
Resource    ${CURDIR}/../Keyword/Feature/Common_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Interview_feature/Key_in_step_1_feature/Key_in_step_1_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Interview_feature/Manage_application_online_feature/Manage_application_online_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Recheck_Key_in_step_1_feature/Recheck_Key_in_step_1_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Key_in_step_2_feature/Key_in_step_2_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Verify_feature/Viewcustomer_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Verify_feature/Verify_call_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Verify_feature/Verify_judment_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Verify_feature/Judment_approve_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Kessai_feature/Kessai_judment_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Kessai_feature/Kessai_judment_approve_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Kessai_feature/Kessai_verify_call_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Changepriority_feature/Changepriority_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Inquiry_application_feature/Inquiry_application_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Setting_feature/Delete_application_on_allowcate_feature/Delete_application_on_allowcate_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Interview_feature/Pending_process_feature/Pending_process_feature.robot    # robotcode: ignore

# yaml
Variables    ${CURDIR}/../Resources/Settings/Setting.yaml
Variables    ${CURDIR}/../Resources/Settings/Excel_Index.yaml
Variables    ${CURDIR}/../Resources/Settings/Title_Btn.yaml
Variables    ${CURDIR}/../Resources/Settings/Interview_yaml/Key_in_step_1_yaml/Key_in_step_1_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Interview_yaml/Manage_application_online_yaml/Manage_application_online_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Recheck_key_in_step_1_yaml/Recheck_key_in_step_1_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Key_in_step_2_yaml/Key_in_step_2_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Verify_yaml/Viewcustomer_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Verify_yaml/Verify_call_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Verify_yaml/Verify_judment_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Verify_yaml/Judment_approve_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Kessai_yaml/Kessai_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Changepriority_yaml/Changepriority_yaml.yaml
Variables    ${CURDIR}/../Resources/Settings/Interview_yaml/Inquiry_application_yaml/Inquiry_application_yaml.yaml