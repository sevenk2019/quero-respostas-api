namespace :dev do
  desc "Popula o banco com dados fakes"

  task populate: :environment do
    100.times do |i|
      puts "É #{i} pá pá pá"

      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Cannabis.cannabinoid_abbreviation,
        university: Faker::University.name
      )
    end
  end
end