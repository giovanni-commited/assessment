*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Library     SeleniumLibrary

Resource        ${CURDIR}/../Engine/Common.robot

Resource        ${CURDIR}/../ObjectRepository/HomePage.robot
Resource        ${CURDIR}/../ObjectRepository/AddUser.robot

Resource        ${CURDIR}/../DataFiles/AddUserCases.robot

Suite Setup     Set Up
Suite Teardown  Clean Up

Test Template     Add Users to User List Table

*** Test Cases ***
TC1     @{Case1}
TC2     @{Case2}

*** Keywords ***
Add Users to User List Table
    [Tags]       AddUser       Success       UserListTable
    [Arguments]     ${name}     ${lastname}     ${password}     ${company}      ${role}     ${email}        ${cell}
    # Navigate to homepage.
    Navigate to ${URL}
    # Navigate to Create User popup.
    Click ${btnAdd} button

    # Username can be generated and checked against the value in the table before proceeding to the create user step.
    ${Username}=     Generate Username
    # Run Create User keyword.
    Create User     ${name}     ${lastname}     ${password}     ${company}      ${role}     ${email}        ${cell}     ${Username}
    
    # Search for new user in table and validate that user exists.
    Input ${Username} into ${txtSearch}
    Validate that ${columnUsername} contains ${Username}

Create User
    [Documentation]     Process for creating user by entering user details and saving user to table.
    [Arguments]     ${name}     ${lastname}     ${password}     ${company}      ${role}     ${email}        ${cell}     ${Username}
    Input ${name} into ${txtFirstName}
    Input ${lastname} into ${txtLastName}

    Input ${Username} into ${txtUserName}
    Input ${password} into ${txtPassword}

    # Get companyId from json file.
    ${companyId}=       Get '${company}' from ${CURDIR}/../DataFiles/Companies.json json file
    Select ${companyId} from ${cbCompany} radio button group
    Select ${role} from ${cmbRole} dropdown
    Input ${email} into ${txtEmail}
    Input ${cell} into ${txtCellphone}
    Click ${btnSave} button
