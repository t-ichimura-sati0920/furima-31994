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

									
##	 items テーブル							
									
| Column 	      | Type 	     |	Options      	                 |
| ------------- | ---------- |	------------------------------ |
| name   	      | string     |	null: false  	               	 |
| price  	   	  | integer    |	null: false  	                 |
| description   | text       |	null: false  	               	 |
| status_id 	  | string     |	null: false  	               	 |
| size          | string     |	null: false  	               	 |
| cost_id       | string     |	null: false  	               	 |
| days_id   	  | string     |	null: false  	               	 |
| category_id   | string     |	null: false  	               	 |
| brand         | string     |	null: false  	               	 |
| prefacture_id | string     |	null: false  	               	 |
| user	        | references |	null: false, foreign_key: true |
									
##	 addresses テーブル						
									
| Column 	     	   | Type   	  | Options 	                     |
| ---------------- | ---------- | ------------------------------ |
| postal_code 	   | string 	  | null: false              	     |
| prefecture  	   | string     | null: false              	     |
| city   	     	   | string     | null: false              	     |
| address 	       | string 	  | null: false              	     |
| bulding_name	   | string 	  |         	                     |
| phone_number	   | string 	  | null: false               	   |
| user        	   | references | null: false, foreign_key: true |
