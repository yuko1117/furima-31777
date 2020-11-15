# テーブル設計

## users テーブル

| Column              | Type   | options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false unique: true |
| email               | string | null: false unique: true |
| password            | string | null: false              |
| first_name          | string | null: false              |
| last_name           | text   | null: false              |
| first_name_katakana | text   | null: false              |
| last_name_katakana  | text   | null: false              |

### Association

- has_many : addresses
- has_many : cards
- has_many : items
- has_many : comments

## addresses テーブル

| Column       | Type       | options     |
| ------------ | ---------- | ----------- |
| post_code    | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
|building_name |string      |             |
|phone_number  | string     | null: false |
| user         | references |             |

### Association

- belongs_to :user


## cards テーブル

| Column          | Type       | options     |
| --------------- | ---------- | ----------- |
| card_number     | string     | null: false |
| expiration_date | string     | null: false |
| security_code   | string     | null: false |
| user            | references |             |

### Association

- belongs_to :user


## items テーブル

| Column              | Type           | options     |
| ------------------- | -------------- | ----------- |
| item_name           | string         | null: false |
| item_explanation    | text           | null: false |
| item_status         | integer        | null: false |
| delivery_fee        | integer        | null: false |
| shipping_area       | integer        | null: false |
| days_until_shipping | integer        | null: false |
| selling_price       | integer        | null: false |
| image               | ActivesStorage |             |
| category            | references     | null: false |
| user                | references     |             |

### Association

- has_many : categories
- has_many : comments 
- belongs_to :user

## categories テーブル

| Column   | Type   |             |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | index       |

### Association

- belongs_to :item



## comments テーブル

| Column | Type       | options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :item
- belongs_to :user

