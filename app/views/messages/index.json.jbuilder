if @new_message.present?
  json.array!(@new_message) do |message|
    json.body  message.body
    json.name message.user.name
    json.created_at  message.created_at.strftime("%Y-%m-%d %H:%M:%S")
    json.image message.image.url
    json.id message.id
  end
end