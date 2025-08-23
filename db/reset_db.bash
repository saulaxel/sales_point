rm ./exampleuser.db

sqlite3 ./exampleuser.db < ./base.sql
sqlite3 ./exampleuser.db < ./productos_ejemplo.sql
