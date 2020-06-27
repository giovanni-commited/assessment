*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Library     SeleniumLibrary

Resource        ${CURDIR}/../Engine/Common.robot
Resource        ${CURDIR}/../ObjectRepository/HomePage.robot
Resource        ${CURDIR}/../ObjectRepository/AddUser.robot

Suite Setup     Set Up
Suite Teardown  Clean Up

Test Template     Add Users to User List Table

*** Test Cases ***
TC1     FName1      LName1      Pass1       Company AAA      Admin       admin@mail.com      082555
TC2     FName2      LName2      Pass2       Company BBB      Customer        cusomter@mail.com       083444

*** Keywords ***
Add Users to User List Table
    [Tags]       AddUser       Success       UserListTable
    [Arguments]     ${name}     ${lastname}     ${password}     ${company}      ${role}     ${email}        ${cell}
    Navigate to ${URL}
    Click ${btnAdd} button

    ${Username}=     Generate Username
    Create User     ${name}     ${lastname}     ${password}     ${company}      ${role}     ${email}        ${cell}     ${Username}
    
    Input ${Username} into ${txtSearch}
    Validate that ${columnUsername} contains ${Username}

Create User
    [Arguments]     ${name}     ${lastname}     ${password}     ${company}      ${role}     ${email}        ${cell}     ${Username}
    Input ${name} into ${txtFirstName}
    Input ${lastname} into ${txtLastName}

    Input ${Username} into ${txtUserName}
    Input ${password} into ${txtPassword}

    ${companyId}=       Get '${company}' from ${CURDIR}/../DataFiles/Companies.json json file
    Select ${companyId}[0] from ${cbCompany} radio button group
    Select ${role} from ${cmbRole} dropdown
    Input ${email} into ${txtEmail}
    Input ${cell} into ${txtCellphone}
    Click ${btnSave} button
