
# fleamarket_sample_76b DB設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|password|string|null:false|
|email|string|null:false, unique:true, index:true|

### Association
- has_one :identification
- has_one :deliver_address
- has_one :card
- has_many :items

## identificationsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string|null:false|
|first_name_kanji|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birthday|date|null:false|
|user_id|integer|null:false, foreign_key: true|

### Association
- belongs_to :user

## deliver_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address1|string|null: false|
|address2|string| |
|telephone|string|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null:false|
|card_token|string|null: false|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_name|string||
|item_condition|string|null:false|
|shipping_payer|string|null:false|
|shipping_from_area|string|null:false|
|shipping_duration|string|null:false|
|price|string|null:false|
|seller_id|integer|null:false, foreign_key: true|
|buyer_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :images

## categoriseテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
