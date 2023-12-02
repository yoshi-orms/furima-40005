FactoryBot.define do
  factory :order_address do
    zip_code                 {"123-4567"}
    prefecture_id            {Faker::Number.between(from: 2, to: 48)}
    city                     {Faker::Address.city}
    street                   {Faker::Address.street_name}
    building                 {Faker::Address.secondary_address}
    phone_number             {"09012345678"}
    token                    {"tok_abcdefghijk00000000000000000"}
  end
end