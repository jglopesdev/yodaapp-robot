*** Settings ***

Library        AppiumLibrary

*** Variables ***
${START}        QAX


*** Keywords ***
Start session    
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true
    
Get started
    Wait Until Page Contains        ${START}        10
    Click Text                      ${START}        10
    
Navigate to
    [Arguments]            ${item_text}
    ${hamburger}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${hamburger}    10
    Click Element                    ${hamburger}
    
    ${menu_item}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${item_text}"]

    Wait Until Element Is Visible    ${menu_item}    10
    Click Element                    ${menu_item}    

Go to item
    [Arguments]                      ${item}    ${checkpoint}
    Wait Until Page Contains         ${item}    10
    Click Text                       ${item}
    Wait Until Page Contains         ${checkpoint}
    
Close session
    Close Application