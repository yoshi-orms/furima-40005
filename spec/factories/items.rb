FactoryBot.define do
  factory :item do
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
    price                {Faker::Commerce.price(range: 300..9999999, as_string: true)}
    association :user
  end
end
