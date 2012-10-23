def sign_in
  visit '/users/sign_in'
  # fill_in "Name", with: @visitor[:name]
  fill_in "Email", with: @visitor[:email]
  fill_in "Password", with: @visitor[:password]
  click_button "Sign in"
end

def create_user
  @visitor ||= { name: "ale", email: "example@example.com", password: "please", password_confirmation: "please" }
  @user = User.create! @visitor
end

def create_project(name)
  project = @user.projects.create! name: name
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I have projects named (.+)$/ do |names|
  names.split(',').each do |name|
    create_project(name)
  end
end

Then /^I should have (\d+) project$/ do |arg1|
  Project.count.should be == arg1
end

Given /^I don't have a project named "(.*)"$/ do |arg1|
  Project.find_by_name(arg1).should be_nil
end

Given /^I have a project named "(.+)"$/ do |name|
  create_project(name)
end

Given /^I on project page$/ do
  @project = Project.first
  visit "/projects/#{@project.id}"
end

When /^I access 'project page'$/ do
  @project = Project.first
  visit "/projects/#{@project.id}"
end
