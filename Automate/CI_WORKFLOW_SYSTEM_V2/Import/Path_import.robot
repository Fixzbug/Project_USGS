*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    OperatingSystem
Library    ${CURDIR}/../Resources/Library/Excel_reader.py

# Excel
Resource    ${CURDIR}/../Keyword/Excel_reader/Excel_reader.robot     # robotcode: ignore

# Keyword
Resource    ${CURDIR}/../Keyword/Common_keyword.robot     # robotcode: ignore

# Feature
Resource    ${CURDIR}/../Keyword/Feature/Common_feature.robot    # robotcode: ignore

Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_01_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_03_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_04_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_06_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_07_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_08_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_09_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_10_feature.robot    # robotcode: ignore

Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_01_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_03_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_06_feature.robot          # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_04_feature.robot          # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_07_feature.robot          # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_08_feature.robot          # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_09_feature.robot          # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Approve_negotiate_10_feature.robot          # robotcode: ignore

Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_01_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_03_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_04_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_06_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_07_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_08_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_09_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Inquiry_10_feature.robot    # robotcode: ignore

# Page
Resource    ${CURDIR}/../Keyword/Page/Capture_Screen.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Sync_sheet_excel.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_01_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_03_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_04_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_06_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_07_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_08_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_09_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_10_page.robot    # robotcode: ignore

Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_01_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_03_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_04_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_06_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_07_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_08_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_09_page.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Approve_negotiate_10_page.robot     # robotcode: ignore

Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_01_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_03_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_04_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_06_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_07_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_08_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_09_page.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Inquiry_10_page.robot    # robotcode: ignore


# Locator
Resource    ${CURDIR}/../Locator/Common_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_01_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_03_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_06_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_04_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_07_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_08_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_09_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_10_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_01_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_03_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_04_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_06_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_07_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_08_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_09_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Approve_negotiate_10_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Inquiry_04_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Inquiry_07_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Inquiry_08_locator.robot
Resource    ${CURDIR}/../Locator/Request_waive_locator/Inquiry_10_locator.robot



# yaml
Variables    ${CURDIR}/../Resources/Settings/Setting.yaml
Variables    ${CURDIR}/../Resources/Settings/Excel_Index.yaml

# variables
Resource    ${CURDIR}/../Resources/Variables/Variables.robot    # robotcode: ignore
