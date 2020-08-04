# furima_27819 データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
- has_one :credit_card
- has_one :destination

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
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|addresses|string|null: false|
|building|string|
|phone_number|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|info|text|null: false|
|category|string|null: false|
|sales_status|string|null: false|
|shipping_fee_status|string|null: false|
|prefecture|string|null: false|
|scheduled_delivery|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user