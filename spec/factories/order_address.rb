FactoryBot.define do
  factory :order_address do
    after(:build) do |message|
      message.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end

    name                 {Faker::Commerce.product_name}
    description          {Faker::Lorem.sentence}
    category_id          {Faker::Number.between(from: 2, to: 11)}
    condition_id         {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_id      {Faker::Number.between(from: 2, to: 3)}
    prefecture_id        {Faker::Number.between(from: 2, to: 48)}
    shipping_day_id      {Faker::Number.between(from: 2, to: 4)}
    price                {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end