# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments


## items テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| user            | references | null: false,foreign_key:true |
| name            | string     | null: false                  |
| description     | text       | null: false                  |
| images_id       | integer    | null: false                  |
| category_id     | integer    | null: false                  |
| condition_id    | integer    | null: false                  |
| price           | integer    | null: false                  |
| postage_id      | integer    | null: false                  |
| prefectures_id  | integer    | null: false                  |
| handing_time_id | integer    | null: false                  |

### Association

- belongs_to :user
- has_one    :purchase
- has_many :comments

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| card_number    | string     | null: false,                   |
| card_period    | string     | null: false,                   |
| security_code  | string     | null: false,                   |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchases      | references | null: false, foreign_key: true |
| post_number    | string     | null: false                    |
| prefectures_id | integer    | null: false,                   |
| city           | string     | null: false,                   |
| house_number   | string     | null: false,                   |
| building_name  | string     |                                |
| phone_number   | string     | null: false,                   |

### Association

- belongs_to :purchase

## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |
| text           | text       | null: false,                   |

### Association

- belongs_to :user
- belongs_to :item
