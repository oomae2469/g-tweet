# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|
|email|string|null: false, default: ""|
|password|string|null: false, default: ""|
|image|string|
### Association
- has_many :tweets
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :like_tweets, through: :likes, source: tweet
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers. through:  :passive_relationships, source: :following

## tweetsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|
|text|string|
|image|text|
### Association
- belongs_to :user, foreign_key: :true
- has_many :comments
- has_many :likes
- has_many :users, through: :likes

## commentsテーブル
|Column|Type|Option|
|------|----|------|
|text|text|
### Association
- belongs_to :user, foreign_key: :true
- belongs_to :tweet, foreign_key: :true

## likesテーブル
|Column|Type|Option|
|------|----|------|
|references|user|null: false|
|references|tweet|null: false|
### Association
- belongs_to :user, foreign_key: :true
- belongs_to :tweet, foreign_key: :true

## relationshipsテーブル
|Column|Type|Option|
|------|----|------|
|integer|following_id|
|integer|follower_id|
### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"