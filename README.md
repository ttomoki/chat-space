# DB設計

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|index: true, null: false|
|group_id|integer|foreign_key: true|
|name|string|index: true, null: false, unique: true|
|mail|string|null: false|

### Association
- has_many :groups through: :members
- has_many :members
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|index: true, null: false|
|user_id|integer|null: false, foreign_key: true|
|group_name|string|index: true, null: false, unique: true|


### Association
- has_many :users through: :members
- has_many :members
- has_many :messages

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|body|text
|image|string

### Association
- belongs_to :group
- belongs_to :user