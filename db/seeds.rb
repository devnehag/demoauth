# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
10.times do
    user = User.create!(
      username: Faker::Internet.username,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password'
    )
    5.times do
        user.jobs.create!(
          status: ['open', 'closed'].sample,
          job_title: Faker::Job.title,
          company: Faker::Company.name,
          job_description: Faker::Lorem.paragraph,
          company_url: Faker::Internet.url,
          date: Faker::Date.between(from: 2.days.ago, to: Date.today),
          point_of_contact: Faker::Name.name,
          job_reference: Faker::Lorem.word,
          tech_stack: Faker::ProgrammingLanguage.name
        )
      end
    end