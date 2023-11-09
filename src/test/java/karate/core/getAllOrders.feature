@Sanity
Feature: Get All orders

  Background:

    * url baseUrl
    * def lastWeek =
    """
    function() {
      var currentDate = new Date();
      var oneWeekAgo = new Date(currentDate.getTime() - 7 * 24 * 60 * 60 * 1000); // Subtracting 7 days in milliseconds
      return oneWeekAgo.toISOString();
    }
    """
    * def currentDate = new Date().toISOString()
    * def lastWeeksDate = lastWeek()

    * print "CURRENT DATE: " + currentDate
    * print "LAST WEEK DATE: " + lastWeeksDate

  @NoQuery
  Scenario: Get All Orders NoQuery
    Given path '/v1/orders'
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].item != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null


  @withMoreThanOneStatus
  Scenario: Get All Orders With More Than One Status Query
    Given path '/v1/orders'
    And param status = 'RETRY'
    And param status = 'SUBMITTED'
    And param status = 'SUCCESS'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null

    And def statusArray = response.data.orders
    And def requiredStatus = ['RETRY', 'SUBMITTED', 'SUCCESS']
    And def containsAny = statusArray.some(order => requiredStatus.indexOf(order.status) != -1)
    And assert containsAny == true


    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].item != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @InvalidSatus
  Scenario: Get All Orders With Invalid Status
    Given path '/v1/orders'
    And param status = 'sasdasd'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders == []
    And match response.data.query.count == 0

  @withOneStatus
  Scenario: Get All Orders With One Status Query
    Given path '/v1/orders'
    And param status = __arg.status
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status contains __arg.status
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].item != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @withNon_EditableStatus
  Scenario: Get All Orders With SUCCESS
    Given path '/v1/orders'
    And param status = 'SUCCESS'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status contains 'SUCCESS'
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].item != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @with_nonSuccessStatus
  Scenario: Get All Orders With CANCELED,FAILED,SKIPPED,SUCCESS Status Query
    Given path '/v1/orders'
    And param status = 'CANCELED,FAILED,SKIPPED,SUCCESS'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null

    And def statusArray = response.data.orders
    And def requiredStatus = ['RETRY', 'SUBMITTED', 'SUCCESS', 'CANCELED', 'FAILED', 'SKIPPED']
    And def containsAny = statusArray.some(order => requiredStatus.indexOf(order.status) != -1)
    And assert containsAny == true

    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].item != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @SubmittedStatus
  Scenario: Get All Orders With SUBMITTED status
    Given path '/v1/orders'
    And param status = 'SUBMITTED'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status contains "SUBMITTED"
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].item != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @withLimit
  Scenario: Get All Orders with limit
    Given path '/v1/orders'
    And param limit = 100
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null
    And assert response.data.query.limit == 100



  @filterBySku
  Scenario: Get All Orders with sku filter
    Given path '/v1/orders'
    And param sku = __arg.sku
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].lineItems[0].item.sku contains __arg.sku
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null


  @filter-by-status
  Scenario: Get All Orders with sku filter
    Given path '/v1/orders'
    And param status = __arg.status
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].lineItems[0].item.sku != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @filterByInvalidSku
  Scenario: Get All Orders with invalid sku filter
    Given path '/v1/orders'
    And param sku = __arg.sku
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders == []
    And match response.data.query.count == 0

  @filterByCustomerId
  Scenario: Get All Orders with customer id filter
    Given path '/v1/orders'
    And param customerId = __arg.customerId
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.id contains __arg.customerId
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].item.sku != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null

  @filterByCustomerName
  Scenario: Get All Orders with customer name filter
    Given path '/v1/orders'
    And param search = __arg.customerName
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.firstName contains __arg.customerName
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].item.sku != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null


  @filterByInvalidCustomerName
  Scenario: Get All Orders with Invalid customer name filter
    Given path '/v1/orders'
    And param search = __arg.customerName
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders == []
    And assert response.data.query.count == 0

  @byScheduledDate
  Scenario: Get All Orders by ScheduledDate

    Given path '/v1/orders'
    And param from = currentDate
    And param to = lastWeeksDate
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.firstName != null
    #And match response.data.orders[*].scheduledDate > lastWeeksDate
    #And match response.data.orders[*].scheduledDate < currentDate
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].item.sku != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null



  @multipleParams
  Scenario: Get All Orders with multiple params
    Given path '/v1/orders'
    And param search = 'John1'
    And param status = 'SCHEDULED'
    And param sku = __arg.sku
    And param limit = 5
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status contains 'SCHEDULED'
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer.firstName contains 'John1'
    And match response.data.orders[*].customer != null
    And match response.data.orders[*].customer.customerReferenceId != null
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].lineItems[0].item.sku contains __arg.sku
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null
    And assert response.data.query.limit == 5

  @bySubId
  Scenario: Get All Orders By SubId
    Given path '/v1/orders'
    And param search = __arg.SubscriptionId
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders[*].id != null
    And match response.data.orders[*].status != null
    And match response.data.orders[*].channel != null
    And match response.data.orders[*].customer != null
    * def SubId = response.data.orders[0].lineItems[0].subscription.id
    * def actualSubId = __arg.SubscriptionId
    * def partialSubId = actualSubId.substring(0, 4)
    And match $SubId contains actualSubId ||  partialSubId
    And match response.data.orders[*].plan != null
    And match response.data.orders[*].plan.frequencyType != null
    And match response.data.orders[*].item.title != null
    And match response.data.orders[*].item.sku != null
    And match response.data.orders[*].shipping != null
    And match response.data.orders[*].shipTo != null
    And match response.data.orders[*].billTo != null


  @byInvalidSubId
  Scenario: Get All Orders By Invalid SubId
    Given path '/v1/orders'
    And param search = __arg.SubscriptionId
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders == []
    And assert response.data.query.count == 0

  @multipleInvalidParams
  Scenario: Get All Orders with Invalid params
    Given path '/v1/orders'
    And param were = 'sdasd'
    And param ert = 'asde'
    And param ert = '80224dss7'
    And param ertern = 5
    And header Content-Type = 'application/json'
    And header Authorization = auth
    When method get
    Then status 200
    And print response
    And match response.data.orders == []
    And assert response.data.query.count == 0
