*** Settings ***
Documentation    For this assignment please use https://test.briqstaging.net, our Funnel application’s staging environment.
...     1. Explore the mentioned Funnel application. Feel free to play around and test what happens.
...     2. Design a couple of test scenarios of what you would like to test, based on what you think are the most important things to test.
...     3. Implement the automated testing of one or more of the scenarios you came up with.
...     4. Make a short list of what could also be tested but is not described in the second question.
...     5. Share your implementation and the list with us in a ZIP file or Git repo.

Resource    ../Resources/Settings.robot
Resource    ../Resources/Generic_Commands.robot
Resource    ../Resources/Verification.robot

Test Setup      Begin Web Test
Test Teardown   End Web Test

# open cmd/terminal and execute:
# robot --loglevel DEBUG -d results --variable BROWSER:{BROWSER} ${PROJECT_PATH}\Tests\Any_Tets.robot

*** Test Cases ***

1001_Briq_booking_page_content
    [Tags]    smoke
    Verify Briq page title
    Verify page header components
    Verify left side menu section [Number of people]
    Verify left side menu section [Date]
    Verify left side menu section [Activity]
    Verify left side menu section [Budget per person]
    Verify sort deals option component
    Verify the card with name [test] is displayed
    Verify the card with name [test 2] is displayed

1002_Briq_booking_page_content_fail_test
    [Tags]    smoke
    Verify Briq page title
    Verify page header components
    Verify left side menu section [Number of people]
    Verify left side menu section [Date]
    Verify left side menu section [Activity]
    Verify left side menu section [Budget per person]
    Verify sort deals option component
    Verify the card with name [test] is displayed
    Verify the card with name [test 333] is displayed

*** Comments ***
    Manual Test Cases are written according Acceptance Criteria and User Stories provided by BA or PO.
    State of Test Cases are initially in Design, once written we change the Status to Ready and upon execution Closed.
    Allocation of test cases can be by Area and Iteration of the product.
    Tagging Test Cases (ex. smoke, regression, automated etc.)

    Scenarios with high priority and severity:
    0. Landing page components - verification
    1. Number of people input field (valid and invalid input)
    2. Date picker selection (Date format, insert date by typing, date in past and in future - max. end date)
    3. View deal - details and description
    4. "I want this" - new modal window validation
    5. Required fields validation (using *, error messages displayed accordignly)
    6. Select your check-in time page components
        6.1 Available times
        6.2 Modify Number of adults (page validation)
        6.3 Modify number of children (page validation)
        6.4 Cancel and Next Step - page navigation verification
    7. Your details
        7.1 Private section (Required input fields and check boxes validation)*
        7.2 Business section (Required input fields and check boxes validation)*
        7.3 Do you have any questions or comments for us? (optional - low priority)
        7.4 Order confirmation section: Date, Number of People, Name, Price details and Total summary
    8. Pay:
        8.1 How would you like to pay? (radio button options not available - only one)
        8.2 Order details section validation
        8.3 Confirm Booking (one moment please loading on button)
        8.3 We have received your booking successfully - confirmation dialog (check mail details, check booking code and booking details)
        8.4 PAY - Critical Bug!

Testing card with name "Test":
    - verify extra product pizza
    - Bug: allowed negative numbers!
    * Critical bug: stuck in loop - How would you like to pay? displays all the time on confirm! no option to go back!

Testing card with name "Test 2":
    *Bug: No Error message is displayed when Number of adults and children is 0 for card name "Test 2" .
    *Critical Bug: loading too long... Request URL: https://test.briqstaging.net/booking/103FE11577174CF2823242900E2FA80C/thanks pending and fails (status code 500)
    Oops, something went wrong! Options available are Go Back and Start Over.




