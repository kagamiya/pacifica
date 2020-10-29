# PACIFICA
## 概要
「PACIFICA」は好きな音楽アルバムのレビューを投稿できる、ソーシャルネットワーキングサービスです。  
音楽アルバム検索機能、Apple Musicによる視聴プレイヤーを備えており、ユーザーは好きな音楽アルバムを簡単に共有することができます。  

アプリケーションの開発にあたっては
- インフラにAWSを使用(コンテナ基盤としてECSを使用)
- CircleCIによるCI/CDパイプライン(自動テスト、自動デプロイ)を構築
- Dockerを開発環境に導入し、本番環境との差異を吸収

など、実務を想定したモダンな技術を活用しました。  
また、本アプリケーションは個人開発ですが、GithubのIssues機能やpull requestを活用することによる擬似チーム開発を行いました。

## URL
https://pacifica.ml
- 常時SSL化
- テストユーザーとして簡単にログイン可能

## 使用技術
- HTML
- CSS
- Javascript / JQuery / Ajax
- Ruby 2.6.5
- Ruby on Rails 6.0.3.4 (minitestによるテスト, Rubocopによる静的解析)
- MySQL 5.7
- Nginx (ウェブサーバー)
- Unicorn (アプリケーションサーバー)
- Git / GitHub (Issues, pull requestによる擬似チーム開発)
- Docker / Docker-compose
- AWS (ECS, ECR, RDS, VPC, ALB, Route53, ACM, IAM)
- CircleCI (CI/CDパイプライン構築による自動テスト, 自動ビルド, 自動デプロイ)

### インフラ構成図
![pacifica-structure](https://user-images.githubusercontent.com/55893072/97518910-8ed83b80-19db-11eb-99d5-b451292bbc29.jpg)

## 主要機能
- ログイン関連
  - ログイン機能 (cookiesによる永続ログイン)

- ユーザー関連
  - ユーザー登録機能
  - ユーザー削除機能 (管理ユーザーのみ)
  - ユーザー一覧表示機能
  - ユーザー詳細表示機能
  - ユーザープロフィール編集機能
  - ユーザープロフィール画像アップロード機能
  - ユーザーフォロー/フォロー解除機能
  - フォローユーザー/フォロワー一覧表示機能

- 投稿関連
  - 投稿機能
  - 音楽アルバム検索機能 (アルバム情報の自動取得)
  - 投稿一覧表示機能
  - フォローユーザーの投稿一覧表示機能
  - 投稿詳細表示機能 (Apple Musicによる試聴プレイヤーの表示)
  - 投稿編集機能
  - 投稿削除機能
  - いいね/いいね解除機能
  - いいねした投稿一覧表示機能
  - コメント機能
  - 投稿検索機能

- その他・共通
  - ページネーション機能
  - Flash機能
  - アクションに対する各種バリデーション

## アプリケーションの主な特徴
- 音楽アルバム検索機能により、アルバム名またはアーティスト名から共有したいアルバムを探すことができる。
- 検索したアルバムの情報(アルバム名、アーティスト名、アルバムアートワーク)を投稿に結びつけることができる。
- 投稿詳細ページにはそのアルバムの音楽プレイヤーが表示され、その場で試聴できる。
- コメント機能により、ユーザー同士でコミュニケーションできる。
- いいね機能により、投稿をいいねし、その一覧を取得できる。
- 投稿検索機能により、アルバム名またはアーティスト名から投稿を探すことができる。

## アプリケーション開発の背景
音楽は私の一番の趣味です。日頃よりレコードの収集や楽器の演奏(ギター)を行い、その関心を深めてきました。  
音楽は一人でも楽しめるものですが、最もすばらしいことは、大好きな曲やアルバムを誰かと共有することです。  
自分の好きな音楽について語ったり、誰かに新しい音楽を教わることを通して、自分の世界を広げ、人生を豊かなものにすることができました。  
また、自分より知識の豊富な人の感想を聞くことは、私にいつも新しい気づきを与えてくれました。  
何気なく聞いていた音楽も誰かの感想を通して聞くと、また違って聞こえるものです。  

しかしながら、これだけインターネットが発達した現在であっても、音楽についてのまとまった感想を探すのは容易ではありません。  
音楽の感想というものは、現状共通のプラットフォームを持っていないのです。  
個々人が各自のブログやSNS等でアップしているものがほとんどです。  
よって、ある音楽についての誰かの感想を探したければ、アルバム名やアーティスト名で検索し、音楽の販売ページの山を乗り越えて、個人のブログやサイトに辿り着かねばなりません。  
さらに、それらは他の無関係な記事や投稿の中に混ざってしまっています。  
その人の他の音楽についての感想を読みたくても、正確にタグ付けなどしていない場合、記事一覧をずっと遡らなければならないことでしょう。  
また、聴いたことのない音楽についての感想を読んで、その場で聴いてみたいと思っても、簡単にはいきません。  
動画サイトやストリーミングサイトに飛んで(場合によってはわざわざ登録したりお金を払って)、その音楽を検索して、やっと聴くことができるのです。  

感想を書く人にとっても、面倒なことはたくさんあります。  
どこかからアルバムのアートワークをダウンロードしてきたり、動画を探してサイトのURLを貼り付けたり、アルバム名やアーティスト名をいちいち打ち込んだり…  
高い評価を受けている音楽であっても、こういった煩雑さからか、感想をアップしている方が非常に少ないのです。  

感想を読む側、書く側の双方が抱えるこうした問題により、素晴らしい音楽に出会ったり、共有する機会が失われていることは非常に残念です。  

そこで、これらの問題を解決した、書き手と読み手双方の共通のプラットフォームとして、「PACIFICA」を開発しました。  
YAMAHAの素晴らしいエレクトリックギターの名を借りたこのアプリケーションでは、誰もが簡単に音楽アルバムのレビューを投稿することができます。  
書き手は、音楽アルバムの検索機能を用いて、シェアしたいアルバムを簡単に見つけ、そのアルバム名、アーティスト名、アートワークを瞬時に投稿に取り入れることができます。  
読み手は、各ユーザーの投稿を見れるだけでなく、ページに備えられたApple Musicの視聴プレイヤーを使って、その場で曲を聴いてみることができます。  

## 今後の課題点など
- テストにminitestではなくRSpecを使用する
- レスポンシブデザインに対応する
- 機能の拡充
