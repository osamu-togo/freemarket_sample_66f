## usersテーブル 
|Column|Type|Options| 
|------|----|-------| 
|name|string|null: false| 
|email|string|null: false| 
|password|string|null: false| 
�
### Association 
- has_many :cards dependent: :destroy
- has_many :items dependent: :destroy
- has_many :addresses dependent: :destroy
- has_many :telephones dependent: :destroy
�
## itemsテーブル 
|Column|Type|Options| 
|------|----|-------| 
|name|strings|null: false| 
|price|int|null: false| 
|user_id|integer|null: false, foreign_key: true| 
|condition|string|null: false| 
|size|string|null: false| 
|way|string|null: false| 
|date|string|null: false|
|category_id|integer|null:false|
|brand_id|integer|null:false|
�
### Association 
- belongs_to :user 
- belongs_to :category 
- belongs_to :brand
- has_many :images dependent: :destroy 


## imagesテーブル
|Column|Type|Options| 
|------|----|-------| 
|id|integer|null: false| 
|url|text|null: false| 
|item_id|int|null: false, foreign_key: true|
�
### Association
- belongs_to :item  


## cardsテーブル 
|Column|Type|Options| 
|------|----|-------| 
|user_id|integer|null: false, foreign_key: true| 
|id|integer|null: false| 
|card_id|integer|null: false,foreign_key: true|  

### Association 
- belongs_to: user


## categoriesテーブル 
|Column|Type|Options| 
|------|----|-------| 
|id|integer|null: false| 
|name|string|null: false|
|parent_id|integer|null: false|

### Association 
- has_many :items
- has_many :categories_brands, dependent: :destroy
- has_many :brands, through:categories_brands�  


## brandsテーブル 
|Column|Type|Options| 
|------|----|-------| 
|name|string|null: false| 
 foreign_key: true| 
|id|integer|null: false, foreign_key: true| 
|categry_id|integer|null: false, foreign_key: true| 

### Association 
- has_many :items
- has_many :categories_brands, dependent: :destroy
- has_many : categories, through:categories_brands 


## categories_brandsテーブル 
|Column|Type|Options| 
|------|----|-------| 
|id|integer|null: false, foreign_key: true| 
|category_id|integer|null: false, foreign_key: true| 
|item_id|integer|null: false, foreign_key: true|
|name|string|null: false| 

### Association 
- belongs_to :category
- belongs_to : brand� 


## addressesテーブル
|Column|Type|Options| 
|------|----|-------|
|user_id|integer|foreign_key:true|
|post_number|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|town|string|null:false|
|building|string||

### Association
- belongs_to :user


## telephonesテーブル
|Column|Type|Options| 
|------|----|-------|
|user_id|integer|foreign_key:true|
|phone_number|string|null:false|

### Association
- belongs_to :user




# テスト
- テストです







