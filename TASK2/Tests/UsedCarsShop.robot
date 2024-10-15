*** Settings ***
Library             Browser
Library             String
Resource            ${PAGE_OBJECTS}/VehicleShopPage.resource
Resource            ${PAGE_OBJECTS}/UsedCarsShopPage.resource
Resource            ${PAGE_OBJECTS}/UsedCarDetailPage.resource

Suite Setup     New page   url=${SHOP_URL}
Test Setup      Select Valid Location

*** Test Cases ***
Invalid enquiring the highest price at Mercedes-Benz
    Open Vehicle List Filter
    Filter by Pre Owned Vehicles
    Filter Used Vehicle By Color  Black
    Sort List Price Hight to Low
    Open First Vehicle of The List
    Save Vehicle Details
    Enquire Vehicle With Invalid Data