json.body  @message.body
json.name @message.user.name
json.created_at  @message.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.image @message.image.url
json.id @message.id

json.flash do
  flash.each do |key, value|
    json.set! key, value
  end
end
