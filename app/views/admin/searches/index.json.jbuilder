json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.admin user.admin
  if user.viewing_time_id
    json.viewing_time_id user.viewing_time_id 
    json.hold_at user.viewing_time.hold_at
    json.program_name user.viewing_time.program_name
  end
end