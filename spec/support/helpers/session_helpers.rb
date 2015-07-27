module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_session_path
      within '.new_registration' do 
        fill_in 'Эл. почта', with: email
        fill_in 'Пароль', with: password
        fill_in 'Подтверждение пароля', :with => confirmation
      end
      click_button 'Зарегистрироваться'
    end

    def signin(email, password)
      visit new_user_session_path
      within '.new_session' do 
        fill_in 'Эл. почта', with: email
        fill_in 'Пароль', with: password
      end
      click_button 'Войти'
    end
  end
end
