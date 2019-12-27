# mockup
Docker:

```
docker build -t mockup .
docker run -p -d 9292:9292 mockup bundle exec rackup
```
Добавление мока:

```json
POST /endpoints
{
  "method":"POST", 
  "path":"books", 
  "status":200, 
  "payload":{
  }
}
```
