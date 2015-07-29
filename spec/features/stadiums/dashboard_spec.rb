feature 'dashboard' do
  before(:all) do 
    @stadium_owner = StadiumUser.create! email: 'test@example.com', password: 'shooshoo'
    @court = Court.create!(name: "Корт", stadium: @stadium_owner.stadium, price: 100)
    signin(@stadium_owner.email, @stadium_owner.password)
  end

  describe 'coaches section' do
    it 'lets you create coach' do
      visit dashboard_coach_users_path
      click_link 'Создать тренера'

      fill_in 'Имя', with: 'Имя'
      fill_in 'Эл. почта', with: 'test_coach@example.com'
      fill_in "Пароль", with: '123123123'
      check @court.name
      fill_in "Стоимость", with: '100'
      fill_in "Подтверждение пароля", with: '123123123'

      expect{ click_button 'Сохранить' }.to change(CoachUser, :count).by 1
      expect(page).to have_text CoachUser.last.name
    end
  end
end