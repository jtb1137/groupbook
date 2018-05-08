FactoryBot.define do
    factory :post do
        title 'title' * 20
        content 'content' * 20
        user
        category
    end
end