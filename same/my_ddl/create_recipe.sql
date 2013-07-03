drop   database if exists rakumesi_recipe;
create database           rakumesi_recipe;
use                       rakumesi_recipe;

create table recipe_data (
recipe_id          int     unsigned not null, # レシピID
user_id       	   int     unsigned not null, # ユーザID
post_date     	   int     unsigned not null, # 投稿日時
subject       	   varchar(100)     not null, # タイトル
washing_num   	   tinyint unsigned not null, # 洗い物の数 
cooking_time  	   tinyint unsigned not null, # 調理時間 
process_num   	   tinyint unsigned not null, # 調理工程数 
rakuuma_count 	   int     unsigned not null, # らくうま数
access_num    	   int     unsigned not null  # アクセス数
) type=InnoDB;

alter table recipe_data
  add primary key (recipe_id),
  add index i1 (user_id, post_date),
  add index i2 (post_date),
  add index i3 (rakuuma_count);

#--------------------------------------------------------
#タグの正規化
create table menu_tag (
menu_id    		   int unsigned 	 not null, # メニューID
tag_id     		   int unsigned 	 not null  # タグID
) type=InnoDB;

alter table menu_tag 
  add primary key (menu_id, tag_id),
  add index i1 (tag_id);

create table tag_data (
tag_id		  	   int unsigned 	 not null, # タグID
tag_name      	   varchar(100)      not null, # タグ
tag_access_num     int unsigned 	 not null, # タグのアクセス回数 
tag_used_num       int unsigned 	 not null  # 料理でのタグの使用回数 
) type=InnoDB;

alter table tag_data 
  add primary key (tag_id),
  add index i1 (tag_name),
  add index i2 (tag_id, tag_access_num),
  add index i3 (tag_id, tag_used_num);
#--------------------------------------------------------
#材料の正規化

create table menu_ingredient (
menu_id            int unsigned 	 not null, # メニューID
ingredient_id      int unsigned  	 not null  # 材料ID
) type=InnoDB;

alter table menu_ingredient 
  add primary key (menu_id, ingredient_id),
  add index i1 (ingredient_id);

create table ingredient_data (
ingredient_id	   int  unsigned 	 not null, # 材料ID
ingredient_name    varchar(100)   	 not null  # 材料
) type=InnoDB;

alter table ingredient_data 
  add primary key (ingredient_id),
  add index i1 (ingredient_name);
#--------------------------------------------------------
#調理工程

create table process_data (
menu_id      	   int unsigned      not null, # メニューID	
process_num  	   tinyint unsigned  not null, # 調理工程番号(1~) 
process_data       text              not null  # 調理工程 
) type=InnoDB;

alter table process_data
  add primary key (menu_id, process_num);
#--------------------------------------------------------
#らくうま

create table rakuuma_user (
menu_id 	       int unsigned      not null,  # メニューID	
rakuuma_user_id    int unsigned  	 not null,  # ユーザーID	
registration_date  int unsigned  	 not null   # 登録日時 
) type=InnoDB;

alter table rakuuma_user
  add primary key (menu_id, rakuuma_user_id),
  add index i1 (rakuuma_user_id),
  add index i2 (rakuuma_user_id, registration_date);
