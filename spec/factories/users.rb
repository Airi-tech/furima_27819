FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password = 'airi1631'
    password { password }
    password_confirmation { password }
    last_name { '佐藤' }
    first_name { '愛里' }
    last_name_kana { 'サトウ' }
    first_name_kana { 'アイリ' }
    birth_date { '1995-12-10' }
  end
end