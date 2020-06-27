*** Settings ***
Documentation       Add User popup, containing user details.

*** Variables ***
${txtFirstName}     xpath=//input[@name="FirstName"]
${txtLastName}      xpath=//input[@name="LastName"]
${txtUserName}      xpath=//input[@name="UserName"]
${txtPassword}      xpath=//input[@name="Password"]
${cbCompany}     optionsRadios
${cmbRole}      xpath=//select[@name="RoleId"]
${txtEmail}     xpath=//input[@name="Email"]
${txtCellphone}     xpath=//input[@name="Mobilephone"]
${btnClose}     xpath=//button[@ng-click="close()"]
${btnSave}      xpath=//button[@ng-click="save(user)"]