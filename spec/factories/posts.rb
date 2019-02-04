FactoryBot.define do
  factory :post do
    text { "MyString" }
    number { 1 }
    user { nil }
    date { "2019-01-27 10:12:09" }
  end
end
