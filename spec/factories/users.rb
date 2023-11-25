FactoryBot.define do
  factory :user do
    username              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name             {'上田'}
    first_name            {'義'}
    last_name_kana        {'ウエダ'}
    first_name_kana       {'ヨシ'}
    birthdate             {'1991-04-28'}
  end
end


