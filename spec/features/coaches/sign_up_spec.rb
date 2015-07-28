# Feature: Coach sign up
#   As a coach  visitor
#   I want to sign up
#   So I can visit protected areas of the site
feature 'Sign Up', :devise do

  # Scenario: Visitor can sign up with valid email address and password
  #   Given I am not signed in
  #   When I sign up with a valid email address and password and choose Тип Тренер
  #   Then I see a successful sign up message
  scenario 'coach visitor can sign up with valid email address and password' do
    sign_up_with('test@example.com', 'please123', 'please123', 'Тренер')
    txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end
end