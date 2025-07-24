User.create!(email: "alishan431@gmail.com") do |user|
  user.name = "Ali Shan"
  user.father_name = "Riaz Ahmed"
  user.cell_no = "03330222960"
  user.city = "Lahore"
  user.country = "Pakistan"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.role = "admin"
  user.approved = true
  user.image.attach(
    io: File.open(Rails.root.join("app/assets/images/default-avatar.png")),
    filename: "default-avatar.png",
    content_type: "image/png"
  )
end