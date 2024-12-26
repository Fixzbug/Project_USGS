*** Variables ***
# Manage Application Online
${Locator_Icon_ManageApp}    //a[@href="#"][contains(text(), 'MANAGE APPLICATION ONLINE')]
${Locator_SmartEnty_MangeApp_Textbox_ID}    id=txt_id_no
${Locator_SmartEnty_MangeApp_Button_Search}    //button[@id="btn_search"]
${Locator_SmartEnty_MangeApp_Hyperlink_View}    //a[@href="#"][contains(text(), 'View')]
${Locator_SmartEnty_MangeApp_Hyperlink_Print}    id=btn_print
${Locator_SmartEnty_MangeApp_Hyperlink_Key1}    //a[@href="#"][contains(text(), 'KeyInStep1')]

# table
${table_data_mangeapp_locator}    //table[@id='tb_cust_interview']//tbody

