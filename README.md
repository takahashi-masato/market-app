
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
|birth_day|date|null:false|
|user_id|integer|null:false|

### Association
- belongs_to :user

## deliver_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer(7)|null: false|
|prefecture|integer|null: false|
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
|payment_card_no|string|null:false, foregin_key:ture|
|payment_card_expire_mm|integer|null: false|
|payment_card_expire_yy|integer|null: false|
|payment_card_security_code|string|null: false|
|user_id|integer|null: false|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|bigint|null: false, foreign_key: true|
|brand_name|string||
|item_condition|string|null:false|
|shipping_payer|string|null:false|
|shipping_from_area|string|null:false|
|shipping_duration|string|null:false|
|price|integer|null:false|
|user_id|integer|null:false|

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
|url|string||
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
