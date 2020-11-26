# 	テーブル設計								
									
##	 users テーブル							
									
| Column 	     	     | Type 	|	Options    	|	
| -------------------| ------ |	-----------	|	
| nickname    	     | string |	null: false |	
| email  	 	  	     | string |	null: false |	
| encrypted_password | string |	null: false |	
| family_name  	     | string |	null: false |	
| first_name  	     | string |	null: false |	
| family_name_kana   | string |	null: false |	
| first_name_kana    | string	|	null: false |	
| birth_day    	     | date   |	null: false |	

### Association

- has_many :items
- has_many :orders
- has_one :address

									
##	 items テーブル							
									
| Column 	      | Type 	     |	Options      	                 |
| ------------- | ---------- |	------------------------------ |
| name   	      | string     |	null: false  	               	 |
| price  	   	  | integer    |	null: false  	                 |
| description   | text       |	 	                          	 |
| status_id 	  | integer    |	 	                           	 |
| size          | string     |	  	                        	 |
| cost_id       | integer    |	                            	 |
| days_id   	  | integer    |	              	               |
| category_id   | integer    |	 	                           	 |
| brand         | string     |	               	               |
| prefacture_id | integer    |	null: false  	               	 |
| user	        | references |	null: false, foreign_key: true |

### Association

- has_many :orders
- belongs_to :user
									
##	 orders テーブル							
									
| Column 	     	   | Type 	    |	Options                        |
| -----------------| -----------|	------------------------------ |	
| family_name  	   | string     |	null: false                    |	
| first_name  	   | string     |	null: false                    |	
| family_name_kana | string     |	null: false                    |	
| first_name_kana  | string	    |	null: false                    |	
| user        	   | references | null: false, foreign_key: true |
| item        	   | references | null: false, foreign_key: true |
| address        	 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

##	 addresses テーブル						
									
| Column 	     	   | Type   	  | Options 	                     |
| ---------------- | ---------- | ------------------------------ |
| postal_code 	   | string 	  | null: false              	     |
| prefecture_id    | integer    | null: false              	     |
| city   	     	   | string     | null: false              	     |
| address 	       | string 	  | null: false              	     |
| bulding_name	   | string 	  |         	                     |
| phone_number	   | string 	  | null: false               	   |
| user        	   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
