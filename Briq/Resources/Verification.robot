*** Settings ***
Resource	../Resources/Settings.robot

*** Keywords ***

########################
### GENERIC KEYWORDS ###
########################

Verify Briq page title
    ${PAGE_TITLE}=  get title
    Log  ${PAGE_TITLE}
    Title Should Be   | Briq Bookings

Verify left side menu section [${SECTION}]
    ensure that element is visible  //button[contains(.,'${SECTION}')]

Verify page header components
    Verify company logo
    Verify contact button
    Verify language locale option button

Verify contact button
    ensure that element is visible  //*[@id='topbar-phone'][contains(.,'Test Me')]

Verify company logo
    ensure that element is visible  //a[@class='topbar__company-logo']

Verify language locale option button
    ensure that element is visible  //*[@id='locale-form']

Verify sort deals option component
    ensure that element is visible  //div[@class='sort-deals-container']//button[@data-id='sort-deals'][@title='Relevance']
    click element  //div[@class='sort-deals-container']//button[@data-id='sort-deals'][@title='Relevance']
    ensure that element is visible  //div[@class='sort-deals-container']//a[.='Price low to high']
    ensure that element is visible  //div[@class='sort-deals-container']//a[.='Price high to low']

### or we can create a generic keyword for any page title validation
Verify that the page title is [${TITLE_TEXT}]
    Ensure that element is visible  //div/span[contains(.,'${TITLE_TEXT}')]

Verify the card with name [${CARD_DATA_NAME}] is displayed
    ensure that element is visible  //div[@data-name='${CARD_DATA_NAME}']

Verify the card with name [${CARD_DATA_NAME}] is not displayed
    SeleniumLibrary.Wait Until Element Is Not Visible  //div[@data-name='${CARD_DATA_NAME}']

Ensure that element is visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Wait Until Element Is Visible  ${elementXpathIdentifier}

Ensure that the element is not visible
	[Arguments]  ${elementXpathIdentifier}
	SeleniumLibrary.Page Should Not Contain Element  ${elementXpathIdentifier}

Verify that User lands on [${PAGE_TITLE}] page
    ensure that element is visible  //span[contains(.,'${PAGE_TITLE}')]

Verify Number of adult people section
    ensure that element is visible  //*[@id='classification-picker-adult']
    #ensure that element is visible  //div[@aria-label='Adjust number of adults']
    ensure that element is visible  //*[@id='classification-picker-adult']//button[@class='person-picker__control decrease']
    ensure that element is visible  //*[@id='classification-picker-adult']//button[@class='person-picker__control increase']

Verify Number of child people section
    ensure that element is visible  //*[@id='classification-picker-child']
    #ensure that element is visible  //div[@aria-label='Adjust number of children']
    ensure that element is visible  //*[@id='classification-picker-child']//button[@class='person-picker__control decrease']
    ensure that element is visible  //*[@id='classification-picker-child']//button[@class='person-picker__control increase']

Verify that the number of adults is [${ADULT_NUM_VAL}]
    ensure that element is visible  //*[@id='adult'][@value='${ADULT_NUM_VAL}']

Verify that the number of children is [${CHILD_NUM_VAL}]
    ensure that element is visible  //*[@id='child'][@value='${CHILD_NUM_VAL}']

Verify Date section components
    ensure that element is visible  //p[.='When do you want to pay us a visit?']
    ensure that element is visible  //*[@id='datefilter']

Verify datepicker days in past are disabled
    ensure that element is visible  //span[@class='flatpickr-day today']/../span[@class='flatpickr-day disabled']

