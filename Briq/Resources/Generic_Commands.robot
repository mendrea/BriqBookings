*** Settings ***
Resource    Settings.robot

*** Keywords ***

Select tomorows date
    click element  //span[@class='flatpickr-day today']/following-sibling::span[1]

Open the datepicker
    Sleep  1
    click element  //*[@id='datefilter']

Within Activity check the [${VALUE}] option
    ensure that element is visible  //input[@value='${VALUE}']/..
    click element  //input[@value='${VALUE}']/..

Increase number of adults
    ensure that element is visible  //*[@id='classification-picker-adult']//button[contains(@class,'increase')]
    click element  //*[@id='classification-picker-adult']//button[contains(@class,'increase')]

Decrease number of adults
    ensure that element is visible  //*[@id='classification-picker-adult']//button[contains(@class,'decrease')]
    click element  //*[@id='classification-picker-adult']//button[contains(@class,'decrease')]

Increase number of children
    ensure that element is visible  //*[@id='classification-picker-adult']//button[contains(@class,'increase')]
    click element  //*[@id='classification-picker-adult']//button[contains(@class,'increase')]

Decrease number of children
    ensure that element is visible  //*[@id='classification-picker-child']//button[contains(@class,'decrease')]
    click element  //*[@id='classification-picker-child']//button[contains(@class,'decrease')]
