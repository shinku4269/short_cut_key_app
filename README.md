## usersテーブル

|Column              |Type  |Options                  |
|--------------------|------|-------------------------|
|nickname            |string|null: false              |
|email               |string|null: false, unique: true|
|encrypted_password  |string|null: false              |


### Association

- has_many :scks
- has_many :comments
- has_many :favorites


## scksテーブル

|Column             |Type      |Options                      |
|-------------------|----------|-----------------------------|
|title              |string    |null: false                  |
|description        |text      |null: false                  |
|key1_id            |integer   |null: false, unless :key_free|
|key2_id            |integer   |                             |
|key3_id            |integer   |                             |
|key_free           |string    |null: false, unless :key1_id |
|user               |references|null: false, foreign_key:true|


### Association

- belongs_to :user
- has_many :comments
- has_many :favorite

## commentsテーブル

|Column |Type      |Options                      |
|-------|----------|-----------------------------|
|content|text      |null: false                  |
|user   |references|null: false, foreign_key:true|
|sck    |references|null: false, foreign_key:true|


### Association

- belongs_to :user
- belongs_to :sck


## favoritesテーブル

|Column |Type      |Options                      |
|-------|----------|-----------------------------|
|user   |references|null: false, foreign_key:true|
|sck    |references|null: false, foreign_key:true|


### Association

- belongs_to :user
- belongs_to :sck