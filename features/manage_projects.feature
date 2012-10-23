Feature: Manage Projects
  In order to create a project
  As an author
  I want to create and manage projects

  Scenario: List Projects
    Given I am logged in
    And I have a project named "Project_test"
    When I go to "the list of projects"
    Then I should see "Project_test"

  Scenario: Create Valid Projects
    Given I am logged in
    And I am on the list of projects
    When I follow "New Project"
    And I press "Create"
    Then I should see "Project must have a name."
    And I fill in "Name" with "Project1"
    And I press "Create Project"
    Then I should see "New project created."
    And I should see "Project1"

  Scenario: Edit a Project
    Given I am logged in
    And I have a project named "Project-one"
    And I am on "the list of projects"
    When I follow "Project-one"
    And I follow "Edit project"
    Then I fill in "Name" with "Project-two"
    And I press "Update Project"
    Then I should see "Project was successfully updated."
    And I should see "Project-two"

  Scenario: Delete a Project
    Given I am logged in
    And I have a project named "Project-one"
    And I am on the list of projects
    When I follow "Remove Project"
    Then I should not see "Project-one"
  
  Scenario: Show a Project
    Given I am logged in
    And I have a project named "Project-one"
    And I am on the list of projects
    When I follow "Project-one"
    Then I should see "Project-one"
    And I should see "Add a card"