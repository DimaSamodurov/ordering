namespace :users do
  desc "Get all users"
  task userlist: :environment do
    User.all.each do |user|
    puts user.email
   end
  end

end
