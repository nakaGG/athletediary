# Athletediary
 アスリートのための練習日記アプリです。<br >
 監督や同じチームの人と共有できます。 <br >
 レスポンシブ対応しているのでスマホからもご確認いただけます。

 # 目指した課題解決
 部活動の監督や部員の練習日記のデジタル化。 <br >

# URL
 https://athletediary.herokuapp.com/<br >

# 使用技術
- Ruby 2.5.7
- Ruby on Rails 6.0.0
- MySQL 12
- RSpec

# 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
- コメント機能
- カレンダー機能(simple_calendar)
# テスト
- RSpec
  - 単体テスト(model)

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