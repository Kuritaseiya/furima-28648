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

## users

|nickname|string|null :false|

|encrypted_password|string|null :false|

|email|string|null :false|

|name|string|null :false|

|last_name|string|null :false|

|KANA_name|string|null :false|

|KANA_last_name|string|null :false|

|birthday|date|null :false|

|has_many|item_id|

|has_one|buy_id|
## items

|item_name|string|null :false|

|category_id|integer|null :false|

|prise|string|null :false|

|product_condition_id|integer|null :false|

|delivery_fee_id|integer|null :false|

|shipment_source_id|integer|null :false|

|guideline|string|null :false|

|user|references|foreign_key :true|

|belongs_to|user_id|

|has_one|live_id|

|has_one|buy_id|

## lives

|postal_code|string|null :false|

|prefecture_id|integer|null :false|

|municipality|string|null :false|

|number|string|null :false|

|phone_number|string|null :false|

|building_name|string|

|item_id|references|foreign_key :true|

|belongs_to|item_id|

## buys

|user_id|references|foreign_key :true|

|item_id|references|foreign_key :true|

|belongs_to|user_id|

|belongs_to|item_id|




