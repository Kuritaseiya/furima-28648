FactoryBot.define do
  factory :form do
    postal_code                        {"123-4567"}
    municipality                       {"上尾市"}
    number                             {"1234-5"}
    phone_number                       {"08011234454"}
    building_name                      {"佐藤ビル"}
    prefecture_id                      { 2 }
    buy_id                             { 1 }
    token {"tok_abcdefghijk00000000000000000"}
    user_id                            { 1 }
    item_id                            { 1 }
  end
end
