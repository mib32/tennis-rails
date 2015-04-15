# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_user(model, email, password)
  user = model.find_or_create_by!(email: email) do |user|
    user.password = password
    user.password_confirmation = password
  end

  puts "CREATED #{model.to_s} USER: " << user.email
end
  
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
SECRETS = Rails.application.secrets

create_user(Admin, SECRETS.admin_email, SECRETS.admin_password)
create_user(Stadium, SECRETS.stadium_email, SECRETS.stadium_password)
create_user(Coach, SECRETS.coach_email, SECRETS.coach_password)
create_user(Customer, SECRETS.customer_email, SECRETS.customer_password)