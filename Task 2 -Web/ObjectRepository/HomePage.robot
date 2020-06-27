*** Settings ***
Documentation       User List Table page, containing list of users.

*** Variables ***
${URL}      http://www.way2automation.com/angularjs-protractor/webtables/
${txtSearch}        xpath=//input[@ng-model="searchValue"]
${btnAdd}       xpath=//button[@type="add"]

# User List Table
${columnUsername}       xpath=//tr[@ng-repeat="dataRow in displayedCollection"]/td[3]