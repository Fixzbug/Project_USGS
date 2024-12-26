*** Variables ***

# Intranet
${URL_Intranet}                           http://intranet/siamac/www/default.aspx?Popup=Y
${btn_SSO}                                //img[@src='../image/Header/icon_sso.png']
${verify_header_locator}                  //div[@class='card-header text-center']
${label_verrify_header}                   //label[@id='lbl_HeaderName']
${label_verrify_username}                 //label[@id='header_UserName']
${label_verrify_branch}                   //label[@id='header_Brach']

# Browser
${BrowserChrome}                          chrome
${BrowserEdge}                            Edge
${BrowserHeadlesschrome}                  headlesschrome

# LOGIN User Authentication
${sso_username_text_area}                 id=txtUsername
${sso_password_text_area}                 //input[@name='password']
${btn_login_on_user_authentication}       //button[@type='submit']

# Portal
${link_system}                            //span[@class='link-primary' and contains(text(),'***replace***')]
${menu_locator}                           //a[contains(.,'***replace***')]
${sub_menu_locator}                       //a[contains(.,'***replace***')]


${spaces}    AAA
