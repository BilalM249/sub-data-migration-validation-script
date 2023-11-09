@Sanity
Feature: Discount validation

  Scenario: Discount validation

    # get all discounts
    * def discounts = call read('classpath:karate/core/GetAllDiscounts.feature@no-query')

    # fetching discount details
    * def id = discounts.response.data.discounts[0].id
    * def offerCode = discounts.response.data.discounts[0].offerCode

    # update item quantity
    * def discounts  = call read('classpath:karate/core/updateDiscount.feature@UpdateItemQuantity'){id: '#(id)'}
