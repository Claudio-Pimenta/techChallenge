*** Variables ***
${location_dialog}                      xpath=//div[@role='dialog'][.//h2[contains(text(),'Please select your location')]]
${location_dialog_state_dropdown}       xpath=//wb-select[./label[text()='* Your state']]//select
${state_dropdown_option}                xpath=//option[text()='OPTION']
${postal_code_input}                    xpath=//wb-input-control[.//label[text()='* Postal Code']]//input
${purpose_private_input}                xpath=//wb-radio-control[.//span[text()='Private']]//input
${purpose_business_input}               xpath=//wb-radio-control[.//span[text()='Business']]//input
${location_dialog_continue_button}      xpath=//button[@data-test-id='state-selected-modal__close']
${filter_button}                        xpath=//span[@class='filter-toggle']
${filter_list}                          xpath=//div[@class='dcp-cars-filter-widget']
${pre_owned_filter_tab}                 xpath=//button/span[contains(text(),'Pre-Owned')]

# Creating Variables for Location Dialog

${VALID_STATE_OPTION}   New South Wales
${VALID_POSTAL_CODE}    2007

*** Keywords ***
Wait For Location Dialog To Be Visible
    Wait For Elements State  ${location_dialog}  visible

# This Keyword Fills the Location Dialog
Select Valid Location
    Wait For Location Dialog To Be Visible
    Click   ${location_dialog_state_dropdown}
    ${state_option}=    Replace String    ${state_dropdown_option}    OPTION    ${VALID_STATE_OPTION}
    Click   ${state_option}
    Type text   ${postal_code_input}  ${VALID_POSTAL_CODE}
    Click   ${purpose_private_input}
    Click   ${location_dialog_continue_button}

Open Vehicle List Filter
    Click   ${filter_button}
    Wait For Elements State  ${filter_list}  visible

    # We click on the Pre Owned Filter Tab and validate the redirection
Filter by Pre Owned Vehicles
    Click   ${pre_owned_filter_tab}
    Wait For Condition    Url    contains    /passengercars/buy/used-car/search-results.html