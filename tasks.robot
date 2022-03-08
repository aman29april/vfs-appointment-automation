*** Settings ***
Library           SeleniumLibrary
# Library         RPA.Browser.Selenium    auto_close=${FALSE}
# Test Teardown    No teardown
# Suite Teardown    No teardown

*** Variables ***
${BROWSER}        chrome
${SELSPEED}       0.1s
${NUM_APPLICANTS}=    ${2}
${MOBILE}=    8826520440
${COUNTRY_CODE}=    +91

*** Test Cases ***
robotframework-testing_selenium
    [Setup]    Run Keywords    Open Browser    https://visa.vfsglobal.com/ind/en/can/book-an-appointment    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Wait Until Page Contains    Online    30
    # Maximize Browser Window
    sleep    3.5sec
    Scroll Element Into View    xpath=(//*[@id="__layout"]/div/main/div/div/div[4]/div[1]/div/div[1]/div[1]/div/div[2]/span)
    Run Keyword And Ignore Error    click    xpath=//*[@id="onetrust-close-btn-container"]/button
    click    xpath=//*[@id="__layout"]/div/main/div/div/div[4]/div[1]/div/div[1]/div[2]
    click    link=click here
    selectWindow    1
    click    id=EmailId


    Wait Until Page Contains    Email    30
    type    id=EmailId    way2itechfdk@gmail.com
    # type    id=EmailId    amankumarfdk@gmail.com
    # type    id=EmailId    aman29april@gmail.com
    # click    xpath=//input[@value='Continue']
    click    id=Password
    # doubleClick    id=Password
    type    id=Password    Aman29april@
    # Sleep    10
    # click    xpath=//span[@id='recaptcha-anchor']/div
    # Sleep    4
    # click    //div[@class="recaptcha-checkbox-checkmark"]
    # click    class:recaptcha-checkbox-border&&ROLE:presentation
    select frame    xpath=//*[@id="ApplicantListForm"]/div[3]/div/div/iframe
    # Run Keyword And Ignore Error    Wait Until Page Contains    Element xpath=//*[@id="ApplicantListForm"]/div[3]    2
    # click    //*[@id="recaptcha-anchor"]/div[1]
    # Sleep    20
    # Run Keyword And Ignore Error    Wait Until Page Contains    Element xpath=(//*[@id="recaptcha-anchor"]/div[4])    25
    Run Keyword And Ignore Error    Wait Until Page Contains    Element div[@class="recaptcha-checkbox-checkmark"]    25
    Unselect Frame
    click    xpath=//input[@value='Continue']
    click    link=Schedule Appointment
    click    id=LocationId
    # select    id=LocationId    Canada Visa Application Center - Jalandhar
    # select    id=LocationId    Canada Visa Application Center - New Delhi
    select    id=LocationId    Canada Visa Application Center - Ahmedabad
    # select    id=LocationId    Canada Visa Application Center - Mumbai
    # select    id=LocationId    Canada Visa Application Centre - Pune
    click    id=NoOfApplicantId
    select    id=NoOfApplicantId    ${NUM_APPLICANTS}
    click    id=VisaCategoryId
    select    id=VisaCategoryId    Biometric Enrolment
    click    xpath=//form[@id='VisaApplicationForm']/div/div[2]
    click    id=IAgree
    click    id=btnContinue
    click    link=Add Applicant
    click    id=DateOfBirth
    type    id=DateOfBirth    1992-04-29
    click    id=FirstName
    click    id=FirstName
    type    id=FirstName    AMAN KUMAR
    click    id=LastName
    doubleClick    id=LastName
    type    id=LastName    AMAN KUMAR
    click    id=DialCode
    type    id=DialCode    ${COUNTRY_CODE}
    click    id=Mobile
    type    id=Mobile    ${MOBILE}
    doubleClick    id=validateEmailId
    click    id=validateEmailId
    type    id=validateEmailId    aman29april@gmail.com
    Unselect Frame
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Retrieve Incomplete Appointments'])[1]/following::div[1]
    click    id=submitbuttonId
    # assertConfirmation    Are you sure you want to submit?
    chooseOkOnNextConfirmation
    IF    ${NUM_APPLICANTS} == 2
        click    link=Add Applicant
        type    id=DateOfBirth    1993-01-18
        click    id=FirstName
        doubleClick    id=FirstName
        type    id=FirstName    PAYAL
        click    id=LastName
        type    id=LastName    GOEL
        click    id=DialCode
        type    id=DialCode    ${COUNTRY_CODE}
        click    id=Mobile
        type    id=Mobile    ${MOBILE}
        click    id=validateEmailId
        type    id=validateEmailId    payal.capricorn17@gmail.com
        Unselect Frame
        click    id=submitbuttonId
        # assertConfirmation    Are you sure you want to submit?
        chooseOkOnNextConfirmation
    END
    click    xpath=//input[@value='Send One-time Password (OTP)']
    sleep    240
    Run Keyword And Ignore Error    Wait Until Page Contains    Element xpath=//*[@id="inline-popups"]/form    60
    # class:fc-day
    # open    https://mail.google.com/mail/u/0/
    # click    id=:3c
    # click    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # click    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td/p[2]
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td
    # selectWindow    win_ser_1
    # click    id=OTPe
    # doubleClick    xpath=//div[@id=':1bs']/div[2]/table/tbody/tr[2]/td
    # type    id=OTPe    986329
    # click    id=txtsub
    # click    xpath=//div[@id='calendar']/table/tr/td[3]/span/span
    # click    xpath=//div[@id='calendar']/table/tr/td[3]/span/span
    # click    xpath=//div[@id='calendar']/table/tr/td/span/span
    # click    xpath=//div[@id='calendar']/table/tr/td/span/span
    [Teardown]    Close Browser
    # [Teardown]

*** Keywords ***
open
    [Arguments]    ${element}
    Go To    ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element    ${element}

click
    [Arguments]    ${element}
    Click Element    ${element}

selectWindow
    [Arguments]    ${index}
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[${index}]

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys    ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text    ${element}    ${value}

selectAndWait
    [Arguments]    ${element}    ${value}
    Select From List By Label    ${element}    ${value}

select
    [Arguments]    ${element}    ${value}
    Select From List By Label    ${element}    ${value}

verifyValue
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

verifyText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

verifyElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

verifyVisible
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

verifyTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

verifyTable
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertConfirmation
    [Arguments]    ${value}
    Alert Should Be Present    ${value}

assertText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertValue
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

assertVisible
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

assertTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

assertTable
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

waitForText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

waitForValue
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

waitForElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

waitForVisible
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

waitForTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

waitForTable
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

doubleClick
    [Arguments]    ${element}
    Double Click Element    ${element}

doubleClickAndWait
    [Arguments]    ${element}
    Double Click Element    ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]    ${code}
    Execute Javascript    ${code}

runScriptAndWait
    [Arguments]    ${code}
    Execute Javascript    ${code}

setSpeed
    [Arguments]    ${value}
    Set Selenium Timeout    ${value}

setSpeedAndWait
    [Arguments]    ${value}
    Set Selenium Timeout    ${value}

verifyAlert
    [Arguments]    ${value}
    Alert Should Be Present    ${value}
# No teardown
#    [Documentation]    Default setup, no teardown at all
#    [Teardown]

chooseOkOnNextConfirmation
    Handle Alert
# No teardown 2
#    [Documentation]    Setup and teardown can be disabled also with special value NONE
#    [Teardown]    NONE
