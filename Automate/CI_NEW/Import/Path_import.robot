*** Settings ***
Library    SeleniumLibrary 
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    ${CURDIR}/../Resources/Library/Excel_reader.py

# Excel
Resource    ${CURDIR}/../Keyword/Excel_reader/Excel_reader.robot    # robotcode: ignore
# Keyword
Resource    ${CURDIR}/../Keyword/Common_keyword.robot     # robotcode: ignore

# Feature
Resource    ${CURDIR}/../Keyword/Feature/Common_feature.robot    # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Feature/Request_waive_feature/Request_waive_01_feature.robot    # robotcode: ignore

# Page
Resource    ${CURDIR}/../Keyword/Page/Capture_Screen.robot     # robotcode: ignore
Resource    ${CURDIR}/../Keyword/Page/Request_waive_page/Request_waive_01_page.robot     # robotcode: ignore

# Locator
Resource    ${CURDIR}/../Locator/Common_locator.robot     # robotcode: ignore
Resource    ${CURDIR}/../Locator/Request_waive_locator/Request_waive_01_locator.robot     # robotcode: ignore

# yaml
Variables    ${CURDIR}/../Resources/Settings/Setting.yaml
