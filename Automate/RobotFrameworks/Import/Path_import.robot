*** Settings ***

Library    SeleniumLibrary
Library    Collections
Library    String
Library    DateTime
Library    JSONLibrary
Library    RequestsLibrary
Library    ${CURDIR}/../Resources/Library/Excel_reader.py    
# Library    ${CURDIR}/../Resources/Library/MyLibrary.py   
# Library    ${CURDIR}/../Resources/Library/TypeChecker.py  
 

# Keyword
Resource    ${CURDIR}/../Keyword/Common_keyword.robot    # robotcode: ignore

# Controller
Resource    ${CURDIR}/../Controller/Common_Controller.robot    # robotcode: ignore
Resource    ${CURDIR}/../Controller/CaptureScreen_controller.robot    # robotcode: ignore
Resource    ${CURDIR}/../Controller/Login_controller.robot    # robotcode: ignore

# Model
Resource    ${CURDIR}/../Model/Excel_Reader_model.robot   # robotcode: ignore

# Views 
Resource    ${CURDIR}/../Views/Login_page.robot    # robotcode: ignore

# Locator
Resource    ${CURDIR}/../Locator/Common_locator.robot    # robotcode: ignore
Resource    ${CURDIR}/../Locator/Login_locator.robot    # robotcode: ignore

# Variables
Resource    ${CURDIR}/../Variables/Variables.robot    # robotcode: ignore

# yaml
Variables    ${CURDIR}/../Resources/Settings/Setting.yaml    # robotcode: ignore

