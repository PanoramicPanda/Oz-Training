Feature: Examples

  Scenario: Testing Home Page
    Given I am on the Demo Home Page
    And I can see that all the content on the page is correct

  Scenario Outline: Testing NavBar Toggles
    Given I am on the Demo Home Page
    And I can see that all the content on the page is correct
    When I click the <Top Level Nav Button>
    Then I can see that all the content on the page is correct
    Examples:
      | Top Level Nav Button    |
      | Input Forms Nav Button  |

  Scenario Outline: Testing Navigation and Defaults
    Given I am on the Demo Home Page
    When I proceed to the <Next Page> Page
    Then I should see the <Next Page> Page
    And I can see that all the content on the page is correct
    Examples:
      | Next Page            |
      | Simple Form Demo     |
      | Checkbox Demo        |
      | Radio Buttons Demo   |
      | Select Dropdown List |

  Scenario: Filling Single Input Field
    Given I am on the Simple Form Demo Page
    When I fill the page with Single Input Field Test
    And I click the Show Message Button
    Then I can see that all the content on the page is correct

  Scenario: Filling Two Input Fields and Getting the Total
    Given I am on the Simple Form Demo Page
    When I fill the page with Two Input Fields Test
    And I click the Get Total Button
    Then I can see that all the content on the page is correct

  Scenario: Filling the Checkbox Demo Page
    Given I am on the Checkbox Demo Page
    When I fill the page with Checkbox Demo Test
    Then I can see that all the content on the page is correct

  Scenario Outline: Filling the Radio Buttons Demo Page
    Given I am on the Radio Buttons Demo Page
    When I fill the page with <Fill Data>
    And I click the Get Checked Value Button
    Then I can see that all the content on the page is correct
    Examples:
      | Fill Data    |
      | Male Test    |
      | Female Test  |
      | Neither Test |

  Scenario: Filling the Select Dropdown List Page
    Given I am on the Select Dropdown List Page
    When I fill the page with Select List Test
    Then I can see that all the content on the page is correct