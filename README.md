# mockup
Docker:

```
docker build -t mockup .
docker run -d -p 9292:9292 mockup bundle exec rackup --host 0.0.0.0 -p 9292
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
