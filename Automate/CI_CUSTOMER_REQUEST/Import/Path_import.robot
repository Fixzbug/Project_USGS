*** Settings ***
Library    SeleniumLibrary 
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    ${CURDIR}/../Resources/Library/Excel_reader.py    # robotcode: ignore


# Keyword
Resource    ${CURDIR}/../Keyword/Common_keyword.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Excel_reader/Excel_reader.robot    # robotcode: ignore


# Feature
Resource    ${CURDIR}/../Keyword/Feature/Common_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_closing_contract_feature/Request_closing_contract_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_update_salary_feature/Request_update_salary_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_re_issue_feature/Request_re_issue_feature.robot    # robotcode: ignore


# Page
Resource    ${CURDIR}/../Keyword/Page/Capture_Screen.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Sync_sheet_excel.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_re_issue_page/Request_re_issue_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_closing_contract_page/Request_closing_contract_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_update_salary_page/Request_update_salary_page.robot    # robotcode: ignore


# Locator
Resource    ${CURDIR}/../Locator/Common_locator.robot     # robotcode: ignore
Resource    ${CURDIR}/../Locator/Inquiry_and_report_locator/Inquiry_and_report_locator.robot     # robotcode: ignore
Resource    ${CURDIR}/../Locator/Request_closing_contract_locator/Request_closing_contract_locator.robot     # robotcode: ignore
Resource    ${CURDIR}/../Locator/Approve_closing_contract_locator/Approve_closing_contract_locator.robot     # robotcode: ignore
Resource    ${CURDIR}/../Locator/Request_re_issue_locator/Request_re_issue_locator.robot     # robotcode: ignore
Resource    ${CURDIR}/../Locator/Request_update_salary_locator/Request_update_salary_locator.robot    # robotcode: ignore


# yaml
Variables   ${CURDIR}/../Resources/Settings/Setting.yaml    # robotcode: ignore
Variables   ${CURDIR}/../Resources/Settings/Excel_Index.yaml    # robotcode: ignore


# variables
Resource    ${CURDIR}/../Resources/Variables/Variables.robot    # robotcode: ignore


