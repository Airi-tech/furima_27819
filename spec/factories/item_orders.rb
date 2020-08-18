FactoryBot.define do
  factory :item_order do
    postal_code          { '111-1111' }
    prefecture_id        { 1 }
    city                 { '札幌市' }
    addresses            { '札幌１' }
    building             { 'コーポ101' }
    phone_number         { '07011111111' }
    stock                { 0 }
    user_id              { 1 }
    item_id              { 2 }
  end
end