# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| username           | string | null: false                   |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birthdate          | date   | null: false                   |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| name            | string       | null: false                    |
| description     | text         | null: false                    |
| category_id     | integer      | null: false                    |
| condition_id    | integer      | null: false                    |
| shipping_fee_id | integer      | null: false                    |
| prefecture_id   | integer      | null: false                    |
| shipping_day_id | integer      | null: false                    |
| price           | integer      | null: false                    |
| user            | references   | null: false, foreign_key: true |

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
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| zip_code     | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |


### Association

- belongs_to :order