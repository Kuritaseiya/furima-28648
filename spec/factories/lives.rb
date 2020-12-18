FactoryBot.define do
  factory :live do
    postal_code                        {"123-4567"}
    municipality                       {"上尾市"}
    number                             {"1234-5"}
    phone_number                       {"08011234454"}
    building_name                      {"佐藤ビル"}
    prefecture_id                      { 2 }
    #buy_id                             { 1 }
  end
end
