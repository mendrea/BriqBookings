*** Settings ***
Documentation    For this assignment please use https://test.briqstaging.net, our Funnel application’s staging environment

Resource    ../Resources/Settings.robot
Resource    ../Resources/Generic_Commands.robot
Resource    ../Resources/Verification.robot

Test Setup      Begin Web Test
Test Teardown   End Web Test

# robot --loglevel DEBUG -d results Tests\Any_Tets.robot

*** Test Cases ***

1001_Briq_booking_number_of_people
    [Tags]    regression
    Verify Briq page title
    Verify page header components
    Verify left side menu section [Number of people]
    ensure that element is visible  //p[.='How many people will join the activities?']
    Verify Number of adult people section
    Verify that the number of adults is [0]
    Verify Number of child people section
    Verify that the number of children is [0]
    Increase number of adults
    Verify the card with name [test] is not displayed
    verify the card with name [test 2] is displayed
    Decrease number of adults
    Verify the card with name [test] is displayed
    verify the card with name [test 2] is displayed
    #Crate keyword for typing a number of adult / children - Bug: allowed negative numbers!

1002_Briq_Date
    [Tags]    regression
    Verify Briq page title
    Verify page header components
    Verify left side menu section [Date]
    Verify Date section components
    Open the datepicker
    Verify datepicker days in past are disabled
    Select tomorows date

1003_Briq_Activity
    [Tags]    regression
    Verify Briq page title
    Verify page header components
    Verify left side menu section [Activity]
    ensure that element is visible  //p[.='What do you want to do?']
    within activity check the [test] option
    Verify the card with name [test 2] is not displayed
    within activity check the [test-2] option
    Verify the card with name [test 2] is displayed

1004_Briq_Budget_per_person
    [Tags]    regression
    Verify Briq page title
    Verify page header components
    Verify left side menu section [Budget per person]
    ensure that element is visible  //p[.='How much would you like to spend per person?']
    drag and drop  css:.to  css:.from
    #drag and drop  //*[@id='budgetfilter']//span[@class='irs-handle to type_last']  //*[@id='budgetfilter']//span[@class='irs-handle from']
    Verify the card with name [test] is displayed
    Verify the card with name [test 2] is not displayed


