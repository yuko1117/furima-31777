# テーブル設計

## users テーブル

| Column              | Type   | options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false unique: true |
| password            | string | null: false              |
| encrypted_password  | string | null: false              |
| first_name          | string | null: false              |
| last_name           | text   | null: false              |
| first_name_katakana | text   | null: false              |
| last_name_katakana  | text   | null: false              |
| birth_date          | date   | null: false              |


### Association

- has_many : items
- has_many : comments
- has_many : purchases

## addresses テーブル

| Column       | Type       | options     |
| ------------ | ---------- | ----------- |
| post_code    | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
|building_name |string      |             |
|phone_number  | string     | null: false |

### Association

- belongs_to :user




## items テーブル

| Column                 | Type           | options     |
| ---------------------- | -------------- | ----------- |
| item_name              | string         | null: false |
| item_explanation       | text           | null: false |
| category_id            | references     | null: false |
| item_status_id         | integer        | null: false |
| delivery_fee_id        | integer        | null: false |
| shipping_area_id       | integer        | null: false |
| days_until_shipping_id | integer        | null: false |
| selling_price          | integer        | null: false |
| image                  | ActivesStorage |             |
| user                   | references     |             |

### Association

- has_many : comments 
- belongs_to :user
- has_one : purchases



## comments テーブル

| Column | Type       | options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column | Type       | options|
| ------ | ---------- | ------ |
| item   | references |        |  
| user   | references |        |

### Association
- belongs_to :item
- belongs_to :user