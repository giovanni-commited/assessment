*** Settings ***
Resource        ../Helpers/Helpers.robot

*** Variables ***
${BROWSER}      Chrome

*** Keywords ***
Set Up
    [Documentation]     Set up before tests run.
    ${DriverPath}=      Get ${BROWSER} Driver
    Create Webdriver        ${BROWSER}      executable_path=${DriverPath}

Clean Up
    [Documentation]     Clean up for when tests are completed.
    Close Browser

Navigate to ${site}
    [Documentation]     Navigation to website.
    Go To    ${site}

Input ${value} into ${field}
    [Documentation]     Enter value into input field.
    Input Text      ${field}        ${value}

Click ${control} button
    [Documentation]     Click specified control.
    Click Button        ${control}

Select ${value} from ${field} dropdown
    [Documentation]     Select a value from the dropdown.
    Select From List By Label       ${field}        ${value}

Select ${value} from ${group} radio button group
    [Documentation]     Select a radio button from the specified group.
    Click Element        xpath=//input[@name="${group}" and @value=${value}]

Validate that ${field} contains ${value}
    [Documentation]     Validate that the text entered in the element is what is expected.
    Element Text Should Be      ${field}        ${value}