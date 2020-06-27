*** Settings ***
Library     String
Library     JSONLibrary

*** Keywords ***
Get ${driver} driver
    [Documentation]     Get specified driver.
    Return from keyword if      '${driver}' == 'Chrome'     ./Drivers/chromedriver.exe

Generate username
    [Documentation]     Generate random username.
    ${randomString}=        Generate Random String      15      [NUMBERS]
    Return from keyword     User${randomString}

Get ${value} from ${filename} json file
    [Documentation]     Get value from json file.
    ${json}=      Load Json From File     ${filename}
    ${jsonValue}=       Get Value From Json     ${json}     ${value}
    Return from keyword     ${jsonValue}[0]
