# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :diaries
- has_many :comments
- has_many :events

## diaries テーブル

| Column     | Type       | Options           |
| ------     | ---------- | ----------------- |
| date       | date       | null: false       |
| title      | text       | null: false       |
| menu       | text       | null: false       |
| reflection | text       | null: false       |
| user       | references | foreign_key: true |

### Association

- has_many :comments
- belongs_to :users

## comments テーブル

| Column    | Type       | Options           |
| ------    | ---------- | ----------------- |
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| diaries   | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :diaries

## event テーブル

| Column    | Type       | Options           |
| ------    | ---------- | ----------------- |
| title     | string     | null: false       |
| content   | text       | null: false       |
| start_time| datetime   | null: false       |
| user      | references | foreign_key: true |

### Association
-belongs_to :user