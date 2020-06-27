### Sites Referenced ###
     https://robotframework.org/SeleniumLibrary/
     https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
     robotframework.org/robotframework/latest/libraries/BuiltIn.html
     https://stackoverflow.com/questions/42083431/how-to-change-reports-or-output-saving-location-in-robot-framework-from-ride
     https://sites.google.com/a/chromium.org/chromedriver/home
     https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html

### Installs ###
     pip install --upgrade robotframework-seleniumlibrary
     pip install robotframework-jsonlibrary

### Notes ###
     Used vscode to write automation code.
     Assuming that the data provided in the 2nd row of the table, in the email column, is intentionally set as 'cusomter@mail.com' and not 'customer@mail.com'.
     Only downloaded driver for chrome browser.

### Execution ###
     To execute the tests please enter the following into the terminal, while in the project base directory:
          robot --outputdir "Reports" --timestampoutputs Tests/AddUser.robot