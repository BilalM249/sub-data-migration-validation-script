@Sanity
Feature: Get Discount by offerCode

  Scenario: Get Discount by offerCode

    # get all discounts
    * def discounts = call read('classpath:karate/core/GetAllDiscounts.feature@no-query')

    # fetching discount details
    * def id = discounts.response.data.discounts[0].id
    * def offerCode = discounts.response.data.discounts[0].offerCode

    # get discount by offerCode
    * def discounts  = call read('classpath:karate/core/getDiscountByOfferCode.feature@valid-offerCode'){offerCode: '#(offerCode)'}