# 	テーブル設計								
									
##	 users テーブル							
									
| Column 	     	   | Type 	|	Options    	|	
| ---------------- | ------ |	-----------	|	
| nickname    	   | string |	null: false |	
| email  	 	  	   | string |	null: false |	
| password     	   | string |	null: false |	
| family_name  	   | string |	null: false |	
| first_name  	   | string |	null: false |	
| family_name_kana | string |	null: false |	
| first_name_kana  | string	|	null: false |	
| birth_day_yy	   | date   |	null: false |	
| birth_day_mm	   | date   |	null: false |	
| birth_day_dd	   | date   |	null: false |	
									
##	 items テーブル							
									
| Column 	     | Type 	    |	Options      	                 |
| ------------ | ---------- |	------------------------------ |
| name   	     | string     |	null: false  	               	 |
| price  	   	 | integer    |	null: false  	                 |
| description  | text       |	null: false  	               	 |
| status 	   	 | string     |	null: false  	               	 |
| size   	   	 | string     |	null: false  	               	 |
| cost   	   	 | string     |	null: false  	               	 |
| days   	     | string     |	null: false  	               	 |
| category     | string     |	null: false  	               	 |
| brand        | string     |	null: false  	               	 |
| prefacture   | string     |	null: false  	               	 |
| user_id	     | references |	null: false, foreign_key: true |
									
##	 addresses テーブル						
									
| Column 	     	   | Type   	  | Options 	                     |
| ---------------- | ---------- | ------------------------------ |
| family_name 	   | string     | null: false                    |
| first_name  	   | string     | null: false              	     |
| family_name_kana | string 	  | null: false              	     |
| first_name_kana  | string 	  | null: false              	     |
| postal_code 	   | string 	  | null: false              	     |
| prefecture  	   | string     | null: false              	     |
| city   	     	   | string     | null: false              	     |
| address 	       | string 	  | null: false              	     |
| bulding_name	   | string 	  |         	                     |
| phone_number	   | string 	  | null: false               	   |
| user_id	     	   | references | null: false, foreign_key: true |
									
##	 cards テーブル							
									
| Column 	     | Type 	    |	Options      	                	|
| ------------ | ---------- |	------------------------------ 	|
| customer_id  | integer    |	null: false  	                 	|
| card_id	     | integer    |	null: false  	                 	|
| user_id	     | references |	null: false, foreign_key: true 	|
