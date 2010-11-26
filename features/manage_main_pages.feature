Feature: Manage main_pages
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
 Scenario: view main page
  Given I am viewing main page
  And I can see link to tea main
  And link contain tea image
  When I click link to tea
  Then I visit tea main page

 Scenario: view main page
  Given I am viewing main page
  And I can see link to coffee main
  And link contain coffee image
  When I click link to coffee
  Then I visit coffee main page
