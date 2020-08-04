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

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
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
|category_id|integer|null: false, foreign_key: true|
|sales_status_id|integer|null: false, foreign_key: true|
|shipping_fee_status_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|scheduled_delivery_id|integer|null: false, foreign_key: true|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_one :destination
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