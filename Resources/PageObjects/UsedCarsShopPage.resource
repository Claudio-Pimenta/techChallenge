*** Settings ***
Library    String

*** Variables ***
${used_vehicles_color_filter_button}        xpath=//div[@data-test-id='emh-filters-content__accordion-item__color']/button
${color_filter_option}                      xpath=//input[@name='COLOR']
${sorting_list_filter_dropdown}             xpath=//wb-select[./label[text()='Sorting']]//select
${sorting_list_filter_high_to_low_option}   xpath=//option[text()='Price: High to Low']
${first_vehicle_of_the_list}                xpath=//div[@class='dcp-cars-srp-results__tile'][1]
${explore_buy_button}                       xpath=//a[text()='Explore & Buy']
${vehicle_model_year}                       xpath=//li[@data-test-id='dcp-vehicle-details-list-item-modelYear']//span[2]

*** Keywords ***
# Here I'm using an argument coming from the test file to be used as a variable
Filter Used Vehicle By Color
    [Arguments]  ${color}
    Click  ${used_vehicles_color_filter_button}
    ${color_option}=    Replace String    ${color_filter_option}    COLOR    ${color}
    Click  ${color_option}

Sort List Price Hight to Low
    Click  ${sorting_list_filter_dropdown}
    Click  ${sorting_list_filter_high_to_low_option}

# here I concatenate two locators to create one
Open First Vehicle of The List
    Click  ${first_vehicle_of_the_list} >> ${explore_buy_button}
    Wait For Condition    Url    contains    passengercars/buy/used-car/product.html/

