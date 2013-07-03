rakumesi_menu


mysql> show tables;

| Tables_in_rakumesi_menu |
|:--|
| ingredient_data         |
| menu_data               |
| menu_ingredient         |
| menu_tag                |
| process_data            |
| rakuuma_user            |
| tag_data                |
7 rows in set (0.00 sec)

mysql> desc ingredient_data;

| Field           | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| ingredient_id   | int(10) unsigned | NO   | PRI | NULL    |       |
| ingredient_name | varchar(16)      | NO   | MUL | NULL    |       |
2 rows in set (0.00 sec)

mysql> desc menu_data;

| Field         | Type                | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| menu_id       | int(10) unsigned    | NO   | PRI | NULL    |       |
| user_id       | int(10) unsigned    | NO   | MUL | NULL    |       |
| post_date     | int(10) unsigned    | NO   | MUL | NULL    |       |
| subject       | varchar(100)        | NO   |     | NULL    |       |
| washing_num   | tinyint(3) unsigned | NO   |     | NULL    |       |
| cooking_time  | tinyint(3) unsigned | NO   |     | NULL    |       |
| process_num   | tinyint(3) unsigned | NO   |     | NULL    |       |
| rakuuma_count | int(10) unsigned    | NO   | MUL | NULL    |       |
| access_num    | int(10) unsigned    | NO   | MUL | NULL    |       |
9 rows in set (0.00 sec)

mysql> desc menu_ingredient;

| Field         | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| menu_id       | int(10) unsigned | NO   | PRI | NULL    |       |
| ingredient_id | int(10) unsigned | NO   | PRI | NULL    |       |
2 rows in set (0.00 sec)

mysql> desc menu_tag;

| Field   | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| menu_id | int(10) unsigned | NO   | PRI | NULL    |       |
| tag_id  | int(10) unsigned | NO   | PRI | NULL    |       |
2 rows in set (0.00 sec)

mysql> desc process_data;

| Field        | Type                | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| menu_id      | int(10) unsigned    | NO   | PRI | NULL    |       |
| process_num  | tinyint(3) unsigned | NO   | PRI | NULL    |       |
| process_data | text                | NO   |     | NULL    |       |

3 rows in set (0.00 sec)

mysql> desc rakuuma_user;

| Field             | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| menu_id           | int(10) unsigned | NO   | PRI | NULL    |       |
| rakuuma_user_id   | int(10) unsigned | NO   | PRI | NULL    |       |
| registration_date | int(10) unsigned | NO   |     | NULL    |       |
3 rows in set (0.00 sec)

mysql> desc tag_data;

| Field    | Type             | Null | Key | Default | Extra |
|:--|:--|:--|:--|:--|:--|
| tag_id   | int(10) unsigned | NO   | PRI | NULL    |       |
| tag_name | varchar(16)      | NO   | MUL | NULL    |       |

2 rows in set (0.00 sec)