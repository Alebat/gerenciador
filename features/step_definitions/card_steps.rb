Given /^this project have a card$/ do
 @card = @project.cards.create! story: "story user"
end

Then /^the project must have no cards$/ do
  @project.cards.count.should be == 0
end

Then /^the card must be moved through columns$/ do
  @card.card_status.status.should be == "Doing"
end

When /^I click "(.*?)" card link$/ do |arg1|
  if arg1 == 'Edit'
    visit edit_card_path(@card)
  elsif arg1 == 'Delete' 
    @project.cards.delete_all
  end
end

When /^I move card to Doing$/ do 
  @card.card_status = CardStatus.where(status: "Doing").first
  @card.save
end
