FactoryBot.define do
  factory :tour do
    name {Faker::Name.name }
    description {Faker::Books::Dune.character}
    duration {Faker::Books::Dune.character}
    price {Faker::Number.between(from: 1000, to: 10000)}
    sort {0}
    max_guest {2}
    min_guest {1}
  end
end
