FactoryBot.define do
  factory :user do
    nickname                        {"maedapopo"}
    email                           {Faker::Internet.free_email }
    name                            {"大前田"}
    last_name                       {"一太郎"}
    kana_name                       {"オオマエダ"}
    kana_last_name                  {"イチタロウ"}
    password                        {"Ninjah2r"}
    password_confirmation           {password}
    birthday                        {"2020-02-22"}
  end
end