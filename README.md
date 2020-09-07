# README

# G-tweet
- 自分の日常を気軽に呟き様々な人との交流をはかる事を目的としたサイトです。
- サイトURL
https://g-tweet-2020.herokuapp.com/
- テストアカウント  
Eメール：sample@sample  
パスワード：sample
### 開発経緯
- TECH CAMPで SNSのコピーサイトを作ったが、機能的に不完全で今の実力でどこまで本物に近づけるのか試してみようと思い作成しました。  
また作成をすることで、今までの学習内容の定着と未知の機能の実装を通してrailsの理解を深めたいと思い作成に至りました。  
はじめに、カリキュラムで実装した機能を洗い出し、その次に既存のアプリを実際に使い何の機能が足りないかを考えました。  
調べた結果、いいね機能、フォロワー機能、DM機能が足りない事に気付き作成を試みました。
 
# 主な使用言語
- Ruby
- Ruby on rails
- Haml
- Scss
- Heroku
# 機能
- deviseを用いたユーザー登録機能
- 呟きの投稿、編集、削除機能
- マイページの作成
- いいね機能
- フォロー機能
# 今後実装したい機能
- DM機能
- コメントなどの非同期通信化
- ユーザー検索機能
# 工夫した点
- アプリのレイアウトなど、できるかぎり自身で考え実装していきました。  
理由として作る過程で自身で考える事により、自分が理解していない部分の明確化や思い通りのレイアウトをするにはどうすればいいか考え調べる能力の向上を図りたかったからです。
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