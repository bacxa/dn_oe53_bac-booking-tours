FactoryBot.define do
  factory :guest do
    name {Faker::Name.name }
    dob {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    status {0}
    booking {FactoryBot.create :booking}
    tour {FactoryBot.create :guest}
  end
end
