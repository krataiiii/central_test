*** Settings ***
Resource      ../Keywords/common_keywords.robot

Suite Setup     Initial Suit
Suite Teardown      TearDown Suit

*** Test Cases ***
Select item and Check item in Cart Success
    [Documentation]    Success Cases
    Go to https://www.powerbuy.co.th/th/ page
    Verify Power Buy page with '#1 Powerbuy© - ช้อปแบรนด์ดัง! สินค้าของแท้ 100% รับประกันการจัดส่ง'
    Waiting Element //*[contains(@class,'MiniCart__CartQty-bJioin bNCDDv')]/span have value 0

    #Search and Select TV with “44 - 55 inches”
    Search The Product    txt-searchBox-input     TV
    Click Button    btn-searchBox-input
    sleep   5s
    Verify search success    lnk-viewHome
    Filter Data By CheckBox    //*[contains(@title, 'ช่วงขนาดหน้าจอ (นิ้ว)')]/div/div/div/div[1]/div/div
    Waiting Element Visible     //*[contains(@class,'ProductGridItem__Label-iQRkAY jLwkyu')]
    sleep   5s
    Click Button  productGrid-261091
    Waiting Element Visible     //*[contains(@class,'Button__StyledButton-r30g8h-0 uwdlB AddToCartButton__AddToCartButtonElem-dtemKR bwuoky')]
    Get Name of Product      (//*[contains(@id,'link-brandName-productDetail')])[1]/span    lbl-productName-productDetail
    Click Button  btn-addCart-261091
    #Add Product Success
    Waiting Element Visible     //*[contains(@class,'Alert-jglfde-0 Notification__CustomAlert-lcdOEy fmgHJA')]
    Waiting Element //*[contains(@class,'MiniCart__CartQty-bJioin bNCDDv')]/span have value 1

    #Search and Select TV with “32 - 43 inches”
    Search The Product    txt-searchBox-input     TV
    Click Button    btn-searchBox-input
    sleep   5s
    Verify search success    lnk-viewHome
    Filter Data By CheckBox    //*[contains(@title, 'ช่วงขนาดหน้าจอ (นิ้ว)')]/div/div/div/div[2]/div/div
    Waiting Element Visible     //*[contains(@class,'ProductGridItem__Label-iQRkAY jLwkyu')]
    sleep   5s
    Click Button  productGrid-261087
    Waiting Element Visible     //*[contains(@class,'Button__StyledButton-r30g8h-0 uwdlB AddToCartButton__AddToCartButtonElem-dtemKR bwuoky')]
    Get Name of Product      (//*[contains(@id,'link-brandName-productDetail')])[1]/span    lbl-productName-productDetail   
    Click Button  btn-addCart-261087
    #Add Product Success
    sleep   10s
    Waiting Element Visible     //*[contains(@class,'Alert-jglfde-0 Notification__CustomAlert-lcdOEy fmgHJA')]
    Waiting Element //*[contains(@class,'MiniCart__CartQty-bJioin bNCDDv')]/span have value 2

    #Check Item
    Click Button    //*[contains(@class,'Icon-sc-134752z-0 ksKMag')]
    Check The Quantity At //*[contains(@class,'Text-sc-9p67zt-0 idNwrK')]/span/span should have 2
    Check Product in Cart Number '1'
    Check Product in Cart Number '2'


    
