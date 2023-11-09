@Sanity
Feature: Update Batching setting

  Scenario: Update Batching setting

    * def UpdateBatchingValidSetting  = call read('classpath:karate/core/updateBatchingSetting.feature@updateBatchingSetting') {consolidationTime : '10', timeFrame : '7'}

    * def UpdateBatchingInvalid1Setting  = call read('classpath:karate/core/updateBatchingSetting.feature@UpdateBatchingInvalid1Setting') {consolidationTime : '-10', timeFrame : '0'}

    * def UpdateBatchingInvalid2Setting  = call read('classpath:karate/core/updateBatchingSetting.feature@UpdateBatchingInvalid2Setting') {consolidationTime : '10.5', timeFrame : '2.6'}

