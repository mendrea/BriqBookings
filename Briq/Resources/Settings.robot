*** Settings ***
Library		SeleniumLibrary	timeout=10 s

*** Variables ***
${ENVIRONMENT}		    test.briqstaging.net/

#Browsers
${BROWSER_CHROME}		chrome
${BROWSER_FIREFOX}      firefox
${BROWSER_EDGE}         Edge

#URLs
${BRIQ_URL}             https://test.briqstaging.net/
${DELAY}			    0

*** Keywords ***
Begin Web Test
    #SeleniumLibrary.Open Browser  about:blank  browser=${BROWSER}
    SeleniumLibrary.Open Browser  ${BRIQ_URL}  ${BROWSER_CHROME}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed  0

Close all open browsers and clear cookies
	SeleniumLibrary.Delete All Cookies
	SeleniumLibrary.Close All Browsers

End Web Test
	Close all open browsers and clear cookies