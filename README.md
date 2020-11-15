# テーブル設計

## users テーブル

| Column              | Type   | options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false unique: true |
| encrypted_password  | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_name_katakana | string | null: false              |
| last_name_katakana  | string | null: false              |
| birth_date          | date   | null: false              |


### Association

- has_many : items
- has_many : comments
- has_many : purchases

## addresses テーブル

| Column        | Type       | options          |
| ------------- | ---------- | ---------------- |
| post_code     | string     | null: false      |
| prefecture_id | integer    | null: false      |
| city          | string     | null: false      |
| address       | string     | null: false      |
|building_name  |string      |                  |
|phone_number   | string     | null: false      |
| purchase      | references | foreign_key: true|

### Association

- belongs_to :purchase

## items テーブル

| Column                 | Type           | options          |
| ---------------------- | -------------- | ---------------- |
| name                   | string         | null: false      |
| explanation            | text           | null: false      |
| category_id            | integer        | null: false      |
| status_id              | integer        | null: false      |
| delivery_fee_id        | integer        | null: false      |
| shipping_area_id       | integer        | null: false      |
| days_until_shipping_id | integer        | null: false      |
| selling_price          | integer        | null: false      |
| user                   | references     | foreign_key: true|


### Association

- has_many : comments 
- belongs_to :user
- has_one : purchase



## comments テーブル

| Column | Type       | options     |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column  | Type       | options|
| ------- | ---------- | ----------------- |
| item    | references | foreign_key: true |  
| user    | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address