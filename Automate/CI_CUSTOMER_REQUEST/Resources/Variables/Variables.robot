*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore    

*** Variables ***

@{crs_status}
    ...    None            # index 0
    ...    In Progress     # index 1
    ...    FAIL            # index 2
    ...    PASS            # index 3
    ...    Cancel          # index 4

@{crs_progress}
    ...    None                          # index 0
    ...    FLOW 1 // Interview Reject    # index 1
    ...    FLOW 2 // Approve Reject      # index 2
    ...    FLOW 3 // Approve Confirm     # index 3

@{crs_sub_progress}
    ...    None                    # index 0
    ...    Request                 # index 1
    ...    Interview Reject        # index 2           
    ...    Interview Confirm       # index 3        
    ...    Approve Return          # index 4           
    ...    Approve Reject          # index 5         
    ...    Approve Confirm         # index 6          

@{crs_user_error}
    ...    ERROR    # index 0


# data 
# group user
${group_user}
${keys_group_user}
${result_excel_user}

# group label
${group_label}
${keys_group_label}
${result_excel_label}

# group label
${group_data_label}
${keys_group_data_label}
${result_excel_data_label}

# group data all
${group_data}
${keys_group_data}
${result_excel} 

# change format date
${request_date_from}
${request_date_to}

# data stock
${ID_card}    none
${card_data_stock}    none
${rows_id_card_data_stock}    none
${rows_card_data_stock}    none
${last_index}    none
${Now_row}    none    
${RowStamp_by_case_idcard}    none             
${RowStamp_by_case_card}    none  

# request no from popup
${result_request_no}

#card
${count_chkbox}
${full_card}
${full_cards}
${card_split_new}

# data
${TC}
${Customer_Name}
${Contract_No}
${Status}
${Card_Type}
${Card_No}
${Due_Date}
${Printer_Name}
${Credit_Limit}
${Credite_Available}
${RL_Limit}
${RL_Available}
${Outstanding_Bal}
${Duty_Bureau}
${Payment_Fee}
${Re_issue_Fee}
${Handling_Fee}
${Transaction_Fee}
${Transaction_Check_up}
${AR2_Fee}
${Slide_Card}
${Re_Entry_Crad_No} 
${Request_No}
${Receive_No}
${State}