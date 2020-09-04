# README

# G-tweet
- Twitterのクローンサイトです
- サイトurl  
https://g-tweet-2020.herokuapp.com/
### 開発経緯
- TECH CAMPで Twitterのコピーサイトを作ったが、機能的に不完全で今の実力でどこまで本物に近づけるのか試してみようと思い作成しました  
また作成をすることで、今までの学習内容の定着と未知の機能の実装を通してrailsの理解を深めたいと思い作成に至りました
 
# 主な使用言語
- ruby
- ruby on rails
- Haml
- scss
- heroku
# 機能
- deviseを用いたユーザー登録機能
- 呟きの投稿、編集、削除機能
- マイページの作成
- いいね機能
- フォロー機能
# 今後実装したい機能
- ダイレクトメール機能
- コメントなどの非同期通信化
- ユーザー検索機能
# 工夫した点
- アプリのレイアウトなど、できるかぎり自身で考え実装していきました。
# インストール方法
1. このリポジトリを複製  
$ git clone https://github.com/oomae2469/g-tweet.git
1. インストールしたリポジトリに移動  
$ cd g-tweet
1. DBの作成、反映  
$ rails db:create
$ rails db:migrate
1. アプリケーションの起動  
$ rails s
# Author
* 作成者：大前貴広

 

## DB設計
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