*** Settings ***
Library    String
Library    OperatingSystem

*** Variables ***
${vehicle_model_year_input}                 xpath=//li[@data-test-id='dcp-vehicle-details-list-item-modelYear']//span[2]
${speak_to_an_expert_button}                xpath=//button[@data-test-id='dcp-cars-buy-box__main-cta-leadform']
${personal_data_dialog_email_input}         xpath=//input[@name='email']
${personal_data_dialog_email_error_label}   xpath=//wb7-control-error[contains(@id,'errorMessa-emailinputfield')]
${personal_data_dialog_submit_button}       xpath=//button[@type='submit']
${personal_data_dialog_error_message}       xpath=//span[@type='error-message']

${FILE_NAME}        MostExpensiveVehicle.txt
${INVALID_EMAIL}    invalidaemail

*** Keywords ***
# Here  I use the OperatingSystem Library to create a file with vin and model year
# For the vin I'm using a keyword from string library the "Fetch from Right" to get it from the URL
Save Vehicle Details
    ${current_url}=  Get Url
    ${vin_number}=  Fetch From Right  ${current_url}  product.html/
    ${vehicle_model_year}=  Get Text  ${vehicle_model_year_input}
    ${vehicle_information}=  Set Variable  ${vin_number} ${vehicle_model_year}

    Create File    ${FILE_NAME}    ${vehicle_information}

# Here I only validated the email input with an invalid email format
Enquire Vehicle With Invalid Data
    Click  ${speak_to_an_expert_button}
    Type Text   ${personal_data_dialog_email_input}  ${INVALID_EMAIL}
    Get Text  ${personal_data_dialog_email_error_label}  ==  Please enter a valid email address.
    Click  ${personal_data_dialog_submit_button}
    Get Text  ${personal_data_dialog_error_message}  ==  Invalid Information



