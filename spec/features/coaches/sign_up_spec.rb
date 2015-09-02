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

  scenario 'Тренер доступен для пользователей сразу после регистрации тренера' do 
    sign_up_with('test@example.com', 'please123', 'please123', 'Тренер')

    click_link 'Тренеры'
    expect(find(:css, '.coaches').all('*')).to_not be_empty
  end

  # scenario 'Тренер доступен для пользователей после регистрации тренера и подтверждения админом' do 
  #   Admin.create! email: 'admin@test.com', password: 'please123'

  #   sign_up_with('test@example.com', 'please123', 'please123', 'Тренер')
  #   logout()
  #   signin 'admin@test.com', 'please123'
  #   click_link
  #   click_link 'Редактировать', match: :first
  #   select 'Активирован', from: 'Статус'
  #   click_button 'Сохранить'
  #   within('#navbar') { click_link 'Стадионы' }   
  #   expect(find(:css, '.stadiums').all('*')).to_not be_empty
  #   click_link 'Без названия'
  #   expect(page).to have_text 'Без названия'
  # end
end