if @new_viewing_time.present?
  json.array! @new_viewing_time do |viewing_time|
    json.id viewing_time.id
    json.capacity viewing_time.capacity
  end
end