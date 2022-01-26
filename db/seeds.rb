NAME = [
  "Sapa",
  "Đà Lạt",
  "Cù Lao Chàm",
  "Phú Quốc",
  "Hội An",
  "Hạ Long"
]

40.times do |n|
  Tour.create name: NAME.sample, description: "Description #{n+1}", price: 10000,
  sort: 0, min_guest: 1, max_guest: 3, duration: "3 ngày 2 đêm", avatar: File.new(Rails.root.join("public/s.jpg"))
end
