unless @reception.nil?
  json.id @reception.id
  json.user_id @reception.user_id
  json.viewing_time_id @reception.viewing_time_id
end