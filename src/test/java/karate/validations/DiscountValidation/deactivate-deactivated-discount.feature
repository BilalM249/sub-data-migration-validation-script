@Sanity
Feature: Discount validation

  Scenario: Discount validation

    # get all discounts
    * def discounts = call read('classpath:karate/core/GetAllDiscounts.feature@active-discounts')

    * if (discounts.response.data.discounts == null) karate.abort()

    # fetching discount details
    * def id = discounts.response.data.discounts[0].id
    * def offerCode = discounts.response.data.discounts[0].offerCode

     # deactivate discount
    * def deactivated = call read('classpath:karate/core/DeactivateDiscount.feature@valid-discount'){id: '#(id)'}

    # deactivate discount again
    * def deactivated1 = call read('classpath:karate/core/DeactivateDiscount.feature@already-deactivated-discount'){id: '#(id)'}