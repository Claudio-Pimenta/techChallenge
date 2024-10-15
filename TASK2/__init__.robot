*** Settings ***
Library         Browser

Suite Setup     Set up browser and environment variables

*** Variables ***
${mercedes_shop_url}        https://shop.mercedes-benz.com/en-au/shop/vehicle/srp/demo
# we can use 'firefox' intead of chromium to test it in firefox
${browser}                  chromium
${headless}                 False

*** Keywords ***
# Setting up environment and browser variables
Set up browser and environment variables
    Set Global Variable    ${BROWSER}           ${browser}
    Set Global Variable    ${RESOURCES}         ${CURDIR}/../techChallenge/Resources
    Set Global Variable    ${PAGE_OBJECTS}      ${RESOURCES}/PageObjects
    Set Global Variable    ${VALIDATORS}        ${RESOURCES}/Validators
    Set Global Variable    ${SHOP_URL}          ${mercedes_shop_url}

    New browser    browser=${BROWSER}   headless=${headless}