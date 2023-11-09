@Sanity
Feature: Discount validation

  Scenario: Discount validation

    # get all discounts
    * def discounts = call read('classpath:karate/core/GetAllDiscounts.feature@active-discounts')

    * if (discounts.response.data.discounts == null) karate.abort()

    # fetching discount details
    * def offerCode = discounts.response.data.discounts[1].offerCode
    * def sku = discounts.response.data.discounts[1].skus[0]
    * def frequency = discounts.response.data.discounts[1].frequency.frequency
    * def frequencyType = discounts.response.data.discounts[1].frequency.frequencyType
    * def itemQuantity = discounts.response.data.discounts[1].itemQuantity
    * def channel = discounts.response.data.discounts[1].channel
    * def target = discounts.response.data.discounts[1].target

    # create subs with these details
    * def createsubs = call read('classpath:karate/core/create-sub-with-offerCode-custom.feature@validDetails'){offerCode: '#(offerCode)',sku: '#(sku)',frequency: '#(frequency)',frequencyType: '#(frequencyType)',itemQuantity: '#(itemQuantity)',channel: '#(channel)',target: '#(target)'}