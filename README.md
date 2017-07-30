# DB設計

## membersテーブル
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
|group_id|references|foreign_key: true|
|name|string|index: true, null: false, unique: true|
|mail|string|index: true, null: false|

### Association
- has_many :groups through: :members
- has_many :members
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|index: true, null: false, unique: true|


### Association
- has_many :users through: :members
- has_many :members
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