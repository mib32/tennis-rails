module TennisHelpers
  module SetupHelpers
    def full_setup
      @user = User.create!(email: 'user@example.com', password: 'blankertag') 
      @user.wallet.deposit! 1000

      @admin = Admin.create!(email: 'admin@example.com', password: 'blinkenblag')
      @stadium_owner = StadiumUser.create!(email: 'stadium@example.com', password: 'blinkenbleg')
      @coach_owner = CoachUser.create!(email: 'coach@example.com', password: 'blinkenblug')

      @stadium = @stadium_owner.product
      @court = Court.create!(stadium: @stadium, price: 100)
      @coach = Coach.create!(price: 100, owner: @coach_owner)
      @service = ProductService.create! service: Service.new(name: 'WC'), price: 10, product: @court
      @periodic_service = ProductService.create! service: Service.new(name: 'Синема'), price: 10, product: @court, periodic: "1"

      @event = Event.create! products: [@court, @coach], product_services: [@service, @periodic_service], start: Time.parse('12:00:00'), end: Time.parse('14:30:00'), user: @user

      @category = Category.create! name: "Футбол"
      @order = Order.create! events: [@event], user: @user
      Option.create tax: 5
    end

    def login_via_post_as user
      post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
    end
  end
end