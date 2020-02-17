user = User.find_by_user_key(ENV['USER_MAIL'])
if user.blank?
    Role.create!(:name => ENV['ROLE'])
    User.create!(email: ENV['USER_MAIL'], password: ENV['USER_PASSWORD'], password_confirmation: ENV['USER_PASSWORD'], firstname: ENV['USER_NAME'], paternal_surname: ENV['USER_PAT_NAME'], maternal_surname: ENV['USER_MAT_NAME'])
    admin = Role.find(1)
    admin.users << User.find_by_user_key(ENV['USER_MAIL'])
    admin.save
end