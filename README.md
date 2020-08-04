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
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_date|date|null: false|
### Association
- has_many :items

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|addresses|string|null: false|
|building|string|
|phone_number|string|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

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
- has_one :destination
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :shipping_fee_status
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery
