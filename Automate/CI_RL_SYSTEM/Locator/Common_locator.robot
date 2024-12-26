*** Variables ***
# Intranet
${URL_Intranet}    http://intranet/siamac/www/default.aspx?Popup=Y
${btn_SSO}    //img[@src='../image/Header/icon_sso.png']
${Locator_SSO_Username}    id=txtUsername
${Locator_SSO_Password}    //input[@name="password"]
${btn_SubmitSSO}    //button[@class="btn btn-primary"]
${link_menu_project_locator}    //span[@class="link-primary"][contains(text(), '***replace***')][1]


# Browser
${BrowserChrome}    chrome    
${BrowserEdge}    Edge  
${BrowserHeadlesschrome}    headlesschrome

# Orther
${Timeout}    150s

# Menu RL
${Locator_Menu}    //a[@href="#"][contains(text(),'***replace***')]
${select_branch_locator}    //ul[@class='chosen-results']

# popup
${popupchange_auto_and_manual}    //*[@id="modeProcess"]
${popupchange_auto_and_manual_btn_confrim}    id=btn-confirm
