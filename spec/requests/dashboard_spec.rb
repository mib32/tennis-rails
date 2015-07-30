require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  context "StadiumUser" do
    before(:all) do 
      @user = StadiumUser.create(email: 'stadium@example.com', password: 'blinkenbleg')
      @court = Court.create(stadium: Stadium.create(owner: @user), price: 100)

      login_via_post_as @user
    end
    %w(dashboard_grid_path
      dashboard_coaches_path
      dashboard_orders_path
      edit_dashboard_product_path
      dashboard_withdrawal_requests_path).each do |path|
      it "visits #{path}" do
        get send(path)

        expect(response.status).to eq(200)
      end
    end
  end
  context "CoachUser" do
    before(:all) do 
      @user = CoachUser.create(email: 'coach@example.com', password: 'blinkenbleg')
      @coach = Coach.create(price: 100, owner: @user)

      login_via_post_as @user
    end
    %w(dashboard_grid_path
      dashboard_employments_path
      dashboard_customers_path
      deposit_requests_path
      edit_dashboard_product_path).each do |path|
      it "visits #{path}" do
        get send(path)

        expect(response.status).to eq(200)
      end
    end
  end
end