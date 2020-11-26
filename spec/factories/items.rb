FactoryBot.define do
  factory :item do
    name                 {"商品"}
    category_id          {"2"}
    price                {"500"}
    explanation          {"これは商品です。"}
    product_condition_id {"2"}
    delivery_fee_id      {"2"}
    prefecture_id        {"2"}
    guideline_id         {"2"}
    association :user, factory: :user
  end
end
