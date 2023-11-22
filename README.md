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
| description     | text         | null: false                    |
| category        | genre_id     | null: false                    |
| condition       | genre_id     | null: false                    |
| shipping_fee    | genre_id     | null: false                    |
| prefecture      | genre_id     | null: false                    |
| shipping_day    | genre_id     | null: false                    |
| price           | decimal      | null: false                    |
| user            | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

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
| zip_code     | genre_id   | null: false                    |
| prefecture   | genre_id   | null: false                    |
| city         | string     | null: false                    |
| street       | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |


### Association

- belongs_to :order