*** Settings ***
Resource        ../setting.robot


*** Keywords ***

Initial Suit
    Set Selenium Timeout    10
    Set Selenium Implicit Wait  10
    ${productDetails}=    Create List
    Set Suite Variable     ${productDetails}

TearDown Suit
    Close Browser

Go to ${url_powerbuy} page
     Open Browser    about:blank    chrome
     Go To           ${url_powerbuy}

Verify Power Buy page with '${title}'
     Title Should Be            ${title}
     Click Element   img-logo-desktop  


Search The Product
     [Arguments]      ${xpath_input}    ${value}
     Element Should Be Visible    ${xpath_input}
     Input Text       ${xpath_input}       ${value}

Waiting Element ${xpath} have value ${value}
     Wait Until Element Contains     ${xpath}    ${value}

Verify search success
     [Arguments]        ${xpath_success}
     Wait Until Element Is Enabled    ${xpath_success}


Click Button
     [Arguments]       ${btn}
     Element Should Be Visible    ${btn}
     Click Element        ${btn}
  
Filter Data By CheckBox
     [Arguments]      ${xpath_checkbox}      
     Element Should Be Visible    ${xpath_checkbox}
      Click Element        ${xpath_checkbox}


Waiting Element Visible
    [Arguments]     ${xpath}
    Element Should Be Visible   ${xpath}

Get Name of Product
    [Arguments]     ${f_xpath}      ${l_xpath}
    ${f_name}=    Get Text  ${f_xpath}
    ${l_name}=    Get Text  ${l_xpath}
    ${name}=    Set Variable    ${f_name}${l_name}
    Log     ${name}
    Append To List      ${productDetails}   ${name}

Check Product in Cart Number '${num}'
    ${productName}=   Get Text      (//*[contains(@class, 'MultipleLineClamp__ProductCutoffDot-jCGKBO fMOIos')])[${num}] 
    Log  ${productName}
    List Should Contain Value   ${productDetails}   ${productName}
    FOR    ${productDetail}    IN    @{productDetails}
        Log    ${productDetail}
    END

Check The Quantity At ${xpath} should have ${value}
     Wait Until Element Contains     ${xpath}    ${value}
    