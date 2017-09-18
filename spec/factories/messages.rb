FactoryGirl.define do

  factory :message do
  	user_id 1
  	group_id 1
    body  Faker::Lorem.sentence
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/matsuoka3.jpg'))
  end

end