# Chat System
## introduction
I use ruby on rails to configure system API's , and use redis and elasticsearch for persistance. <br />
## specs
you need docker to run service.
## deployment 
Just run following commands
```
docker-compose up -d
```
And finally for migration run 
```
docker-compose exec web bash
```
Then 
```
rake db:migrate
```
## Testing 
I added postman collection with regular API's for testing.
