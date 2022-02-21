FactoryBot.define do
  factory :booking do
    est_start_date {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    start_date {Faker::Time.between(from: DateTime.now, to: DateTime.now)}
    status {1}
    tour {FactoryBot.create :tour}
    user {FactoryBot.create :user}
  end
end
