# DB設計

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false, unique: true|
|mail|string|index: true, null: false|

### Association
- has_many :groups through: :group_users
- has_many :group_users
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|index: true, null: false, unique: true|


### Association
- has_many :users through: :group_users
- has_many :group_users
- has_many :messages

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
|body|text
|image|string

### Association
- belongs_to :group
- belongs_to :user