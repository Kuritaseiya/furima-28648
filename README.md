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

|email|string|null :false|

|encrypted_password|string|null :false|

|name|string|null :false|

|KANA_name|string|null :false|

|birthday|string|null :false|


## items

|item_name|string|null :false|

|category|string|null :false|

|prise|string|null :false|

|seller|string|null :false|

|product_condition|string|null :false|

|delivery_fee|string|null :false|

|shipment_source|string|null :false|

|guideline|string|null :false|

|user_id|string|null :false|

## lives

|postal_code|string|null :false|

|prefecture_id|integer|null :false|

|municipality|string|null :false|

|number|string|null :false|

|phone_number|string|null :false|

|building_name|string|

|item_id|string|null :false|

## buys

|user_id|string|null :false|

|item_id|string|null :false|




