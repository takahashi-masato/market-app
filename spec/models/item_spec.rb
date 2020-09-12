require 'rails_helper'

describe Item do
    describe '#create' do

      before do
        @user = FactoryBot.create(:user)
      end
    
    context 'messageを保存できる場合' do
        #全てにデータが入っている。ブランドの有無
      it "全てのカラムにデータが入っている" do
        item = FactoryBot.build(:item)
        item.valid?
        expect(item).to be_valid
      end

      it "ブランドを空にする" do
        item = FactoryBot.build(:item)
        item.valid?
         expect(build(:item, brand_name:  nil)).to be_valid
      end
      
    end
    context 'messageを保存できない場合' do
        #各項目にnillを設定
      it "is valid with a name, images" do
        item = FactoryBot.build(:item)
        item.valid?
        expect(item).to be_valid
      end
      it "nameを空に" do
        item = build(:item, name: nil)
        item.valid?
      end
      it "descriptionを空に" do
        item = build(:item,description: nil)
        item.valid?
      end
      it "category_idを空に" do
        item = build(:item,category_id: nil)
        item.valid?
      end
      it "item_conditionを空に" do
        item = build(:item,item_condition: nil)
        item.valid?
      end
      it "shipping_payerを空に" do
        item = build(:item,shipping_payer: nil)
        item.valid?
      end
      it "shipping_from_areaを空に" do
        item = build(:item,shipping_from_area: nil)
        item.valid?
      end
      it "shipping_from_areaを空に" do
        item = build(:item,shipping_from_area: nil)
        item.valid?
      end
      it "shipping_durationを空に" do
        item = build(:item,shipping_duration: nil)
        item.valid?
      end
      it "priceを空に" do
        item = build(:item,price: nil)
        item.valid?
      end
      it "imageを空に" do
        item = build(:image,image: nil)
        item.valid?
      end
    end
  end
end