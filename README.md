# DATABASE

## users table  

|Column|Type|Options|  
|:--------|:------|:------------------------|  
|name     |string |null: false, unique: true|

## assosiation
has_many: comments  
has_many: groups  
throuth: users_groups  

## groups table  

|Column|Type|Options|  
|:--------|:------|:------------------------|  
|name     |string |null: false, unique: true|

## assosiation
has_many: comments  
has_many: users  
throuth: users_groups  

## comments table  

|Column|Type|Options|  
|:--------|:------|:----------|  
|body     |text   |null: false|
|image    |string |null: false|
|user_id  |integer|null: false, foreign_key: true|
|group_id |integer|null: false, foreign_key: true|

## assosiation
belongs_to: users  
belongs_to: groups  
 
## users_groups table  

|Column|Type|Options|  
|:--------|:------|:----------|  
|user_id  |integer|null: false, foreign_key: true|
|group_id |integer|null: false, foreign_key: true|
