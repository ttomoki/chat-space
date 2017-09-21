FactoryGirl.define do

  factory :message do
    body  Faker::Lorem.sentence
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/matsuoka3.jpg'))
  end

end