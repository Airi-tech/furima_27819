# furima_27819 データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_date|date|null: false|
### Association
- has_many :items
- has_many :comments
- has_many :orders

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|addresses|string|null: false|
|building|string|
|phone_number|string|null: false, unique: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to_active_hash :prefecture

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|info|text|null: false|
|category_id|integer|null: false|
|sales_status_id|integer|null: false|
|shipping_fee_status_id|integer|null: false
|prefecture_id|integer|null: false|
|scheduled_delivery_id|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_one :order
- has_one :address
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee_status
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
