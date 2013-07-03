drop   database if exists rakumesi_user;
create database           rakumesi_user;
use                       rakumesi_user;

create table rakumesi_user_data (
  user_id        	     int     unsigned  not null, # ユーザID
  kanji_last_name	     varchar(100)              , # 漢字 性
  kanji_first_name	     varchar(100)              , # 漢字 名
  hira_last_name	 	 varchar(100)              , # ひらがな 性
  hira_first_name	     varchar(100)              , # ひらがな 名
  e_mail  	             varchar(100)              , # メールアドレス
  rakuuma_num    	     int  	 unsigned  not null  # 総らくうま数
) type=InnoDB;

alter table rakumesi_user_data
 add primary key     (user_id),
 add unique index i1 (rakuuma_num);

create table follow (
   user_id               int     unsigned  not null, # ユーザID
   follow_user_id        int     unsigned  not null, # followしたユーザーID
   follow_date  	     int     unsigned  not null  # 登録日時
) type=InnoDB;

 alter table follow
  add primary key (user_id, follow_user_id),
  add index i1    (follow_user_id, follow_date);

create table stock_list (
  user_id                int  	 unsigned  not null, # ユーザID
  menu_id            	 int  	 unsigned  not null, # ストックしたメニューID
  stock_date  			 int  	 unsigned  not null  # 登録日時
) type=InnoDB;

alter table stock_list 
 add primary key (user_id, menu_id),
 add index i1    (menu_id, stock_date);
