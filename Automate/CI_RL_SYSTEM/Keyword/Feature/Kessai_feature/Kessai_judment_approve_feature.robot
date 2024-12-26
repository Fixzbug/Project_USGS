*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

SET INPUT AND SELECT TO CLICK CONFIRM KESSAI APPROVE
    [Arguments]    ${tc_index}

    Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - SELECT DROPDOWN DOCUMENT APPROVE    ${tc_index}

        Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - INPUT NAME ENG    ${tc_index}

            Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - INPUT LAST NAME ENG    ${tc_index}

                Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - SELECT DROPDOWN BUILDIN    ${tc_index}

                    Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - INPUT BUILDIN    ${tc_index}

                        Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - INPUT ADDRESS    ${tc_index}

                            Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - INPUT MOO    ${tc_index}

                                Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - INPUT ROAD    ${tc_index}

                                    Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - SELECT DROPDOWN PAYMENT TYPE    ${tc_index}

                                        Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - SELECT DROPDOWN REC TYPE    ${tc_index}

                                            Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - SELECT DROPDOWN FIRSTLOAN    ${tc_index}

                                                Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - CLICK BUTTON CONFIRM

                                                    Kessai_judment_approve_page.KESSAI JUDMENT APPROVE - CLICK BUTTON YES CONFIRM

                                                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KESSAI_APPROVE_PAGE
                                                            
                                                            Capture_screen.CAPTURE SCREEN CURRENT PAGE