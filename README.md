# livelup DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index :users, [:name, :email]|
|image|string||
### Association
- has_many :groups, through: :groups_users
- has_many :groups_users
- has_many :tweets
- has_many :messages
- has_many :likes, dependent: :destroy
- has_many :liked_tweets, through: :likes, source: :tweet
- acts_as_ordered_taggable_on :category
##  groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :users, through: :groups_users
- has_many :groups_users

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, add_index :groups_users, :user_id|
|group_id|integer|null: false, foreign_key: true, add_index :groups_users, :group_id|
### Association
- belong_to :user
- belong_to :group

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|user_id|integer|null: false, foreign_key: true, add_index :tweets, :user_id|
### Association
- belong_to :user
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :messages 
- acts_as_ordered_taggable_on :category

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true, :user_id|
|tweet_id|integer|null: false, foreign_key: true, :tweet_id|
### Association
- belong_to :user
- belongs_to :tweet

## liked-users
|Column|Type|Options|
|------|----|-------|
|like_id|integer|null: false, foreign_key: true, :like_id|
|user_id|integer|null: false, foreign_key: true, :user_id|
### Association
- belongs_to :like
- belong_to :user

## liked-tweets
|Column|Type|Options|
|------|----|-------|
|like_id|integer|null: false, foreign_key: true, :like_id|
|tweet_id|integer|null: false, foreign_key: true, :tweet_id|
### Association
- belongs_to :like
- belong_to :tweet

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|user_id|integer|null: false, foreign_key: true, :user_id|
|tweet_id|integer|null: false, foreign_key: true, :tweet_id|
### Association
- belongs_to :user
- belongs_to :tweet

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.5.1p57

* Rails 5.2.4.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
