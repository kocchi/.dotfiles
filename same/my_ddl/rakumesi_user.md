rakumesi_user

mysql> show tables;

| Tables_in_rakumesi_user |
|:-------------------------|
| follow                  |
| sp_login_session_seed   |
| user_data               |
|stock_list|
3 rows in set (0.00 sec)

mysql> desc user_data;

| Field          | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| user_id        | int(10) unsigned | NO   | PRI | NULL    |       |
| reg_date       | int(10) unsigned | NO   |     | NULL    |       |
| user_status    | tinyint(4)       | NO   |     | NULL    |       |
| service_status | tinyint(4)       | NO   |     | NULL    |       |
| carrier        | char(1)          | NO   |     | NULL    |       |
| model_name     | varchar(20)      | NO   |     | NULL    |       |
| subscribers_id | varchar(40)      | YES  | UNI | NULL    |       |
| nickname       | varchar(16)      | NO   | UNI | NULL    |       |
| sex_type       | char(1)          | NO   |     | NULL    |       |
| introduction   | text             | NO   |     | NULL    |       |
| login_id       | varchar(32)      | YES  |     | NULL    |       |
| login_passwd   | varchar(32)      | YES  |     | NULL    |       |
| follow_num     | int(10) unsigned | NO   |     | NULL    |       |
| follower_num   | int(10) unsigned | NO   |     | NULL    |       |
| rakuuma_num    | int(10) unsigned | NO   | UNI | NULL    |       |

15 rows in set (0.00 sec)

mysql> desc sp_login_session_seed;

| Field        | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| user_id      | int(10) unsigned | NO   | PRI | NULL    |       |
| session_seed | text             | NO   |     | NULL    |       |

2 rows in set (0.00 sec)

mysql> desc follow;

| Field             | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| user_id           | int(10) unsigned | NO   | PRI | NULL    |       |
| follow_user_id    | int(10) unsigned | NO   | PRI | NULL    |       |
| registration_date | int(10) unsigned | NO   |     | NULL    |       |

3 rows in set (0.00 sec)

mysql> desc stock_list;

| Field             | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| user_id           | int(10) unsigned | NO   | PRI | NULL    |       |
| menu_id           | int(10) unsigned | NO   | PRI | NULL    |       |
| registration_date | int(10) unsigned | NO   |     | NULL    |       |

3 rows in set (0.00 sec)