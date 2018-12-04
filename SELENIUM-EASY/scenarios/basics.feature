Feature: Examples

  Scenario: Testing Home Page
    Given I am on the Demo Home Page
    And I can see that all the content on the page is correct

  Scenario Outline: Testing NavBar Toggles
    Given  I am on the Demo Home Page
    And I can see that all the content on the page is correct
    When I click the <Top Level Nav Button>
    Then I can see that all the content on the page is correct
    Examples:
      | Top Level Nav Button    |
      | Input Forms Nav Button  |
