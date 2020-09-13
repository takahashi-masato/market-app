FactoryBot.define do

  factory :item do
    name              {"factory"}
    description       {"テスト用"}
    category_id       {"2"}
    brand_name        {"brand"}
    item_condition    {"新品"}
    shipping_payer    {"送料込み（出品者負担）"}
    shipping_from_area{"東京都"}
    shipping_duration {"1~2日"}
    price             {"1200"}
    #seller_id         {"1"}
    #seller_id { FactoryBot.create(:user)}
    seller { FactoryBot.create(:user)}
      

    after(:build) do |item|
      item.images << FactoryBot.build(:image, item: item)
    end
  end

  factory :image do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.jpg"), 'image/png') }
  end  
end