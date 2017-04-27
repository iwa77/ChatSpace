# DATABASE

## users table  

|Column|Type|Options|  
|:--------|:------|:------------------------|  
|name     |string |null: false, unique: true,  index: true|


## assosiation
has_many: comments  
has_many: groups  
through: user_groups  

## groups table  

|Column|Type|Options|  
|:--------|:------|:------------------------|  
|name     |string |null: false, unique: true, index: true|


## assosiation
has_many: comments  
has_many: users  
through: user_groups  


## comments table  

|Column|Type|Options|  
|:--------|:------|:----------|  
|body     |text   |null: false|
|image    |string |null: false|
|user_id  |references|null: false, foreign_key: true|
|group_id |references|null: false, foreign_key: true|

## assosiation
belongs_to: users  
belongs_to: groups  
 
## user_groups table  

|Column|Type|Options|  
|:--------|:------|:----------|  
|user_id  |references|null: false, foreign_key: true|
|group_id |references|null: false, foreign_key: true|

## assosiation
belongs_to: users  
belongs_to: groups  
