@Sanity
Feature: Get Batching setting

  Scenario: Get Batching setting

    * def UpdateBatchingValidSetting  = call read('classpath:karate/core/updateBatchingSetting.feature@updateBatchingSetting') {consolidationTime : '10', timeFrame : '7'}

    * def consolidationTime = UpdateBatchingValidSetting.response.data.consolidationTime
    * def timeFrame = UpdateBatchingValidSetting.response.data.timeFrame

    * def getBatchingSetting  = call read('classpath:karate/core/getBatchingSetting.feature@getBatchingSetting'){consolidationTime : '#(consolidationTime)', timeFrame : '#(timeFrame)' }