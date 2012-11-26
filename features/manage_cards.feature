Feature: Manage Cards
  In order to manage a card
  As an author
  I want to create and manage cards

  Scenario: Add a card on project
    Given I am logged in
    And I on project page
    And I follow "Add a card"
    Then I fill in "Story" with "Story content"
    And I press "Create Card"
    When I access 'project page'
    Then I should see "Story content"

  Scenario: Destroy card
    Given I am logged in
    And I on project page
    And this project have a card
    When I click "Delete" card link
    Then the project must have no cards

  Scenario: Edit card
    Given I am logged in
    And I on project page
    And this project have a card
    When I click "Edit" card link
    And I fill in "Story" with "Teste change"
    And I press "Update"
    Then I should see "Teste change"
    And I should see "Card updated"

  Scenario: Move card
    Given I am logged in
    And I on project page
    And this project have a card
    When I move card to Doing
    Then the card must be moved through columns