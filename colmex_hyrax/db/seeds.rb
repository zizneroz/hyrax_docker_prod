Role.create!(:name => "admin")
User.create!(email: "admin@colmex.mx", password: "12345678", password_confirmation: "12345678")
admin = Role.find(1)
admin.users << User.find_by_user_key("admin@colmex.mx")
admin.save