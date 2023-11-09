@Sanity
Feature: Get Subs by valid sub Id

  Background:

    * url baseUrl

  Scenario: Get Subs by valid sub Id

    * def createsubs  = call read('classpath:karate/core/createSubscriptionWithSKU.feature@success'){sku : '#(sku1)'}

    * def id = createsubs.response.data.subscriptions[0].id

    * def getSub  = call read('classpath:karate/core/getSubscriptionById.feature@validSubId'){id : '#(id)'}
