# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| username           | string | null: false                   |
| email              | string | null: false, uniqueness: true |
| password           | string | null: false                   |
| encrypted_password | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthdate          | date   | null: false                   |

### Association

- has_many :items
- has_many :orders
- has_one :address

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image_url       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_fee    | string     | null: false                    |
| prefecture      | string     | null: false                    |
| shipping_day    | string     | null: false                    |
| price           | decimal    | null: false                    |

### Association

- belongs_to :user
- has_many :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| zip_code     | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |


### Association

- belongs_to :user