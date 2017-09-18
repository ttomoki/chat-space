FactoryGirl.define do

  factory :message do
  	id "1"
  	user_id  "1"
  	group_id  "1"
    body  "abe"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/matsuoka3.jpg'))
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end