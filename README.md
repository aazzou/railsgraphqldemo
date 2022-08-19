# GraphQL Demo

**Sample Rails - GraphQL - JWT demo**

 ```shell
 $ git clone https://github.com/aazzou/railsgraphqldemo
 $ cd graphqldemo
 $ bundle install
 $ bundle exec rake db:create
 $ bundle exec rake db:migrate
 $ bundle exec rake db:seed
 $ bundle exec rspec
 $ bundle exec rails s
 ```
A React frontend client for this API can be found at [https://github.com/aazzou/reactgraphqldemo](https://github.com/aazzou/reactgraphqldemo)

**Query examples**

#### Login mutation

```graphql
mutation{ 
    logged_in_user(
        auth: {
          email: "said@email.com",
          password: "secret01"
        }) {
        ok,
        jwt,
        user {
          id
          email
        }
      }
  }
```


```json
{
  "data": {
    "logged_in_user": {
      "ok": true,
      "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NzczODE0NzR9.NSDSJvuEsXzjKbD-ag9DpdDnnweFS7FSi-E29IcL5uo",
      "user": {
        "id": "1",
        "email": "said@email.com"
      }
    }
  }
}
```

#### Messages query

```header
Content-Type: application/json
Authorization: bearer <RECEIVED_JWT_TOKEN>
```

```graphql
query{
  messages{
    title
    content
    user {
      email
    }
  }
}
```

#### Add new message

```header
Content-Type: application/json
Authorization: bearer <RECEIVED_JWT_TOKEN>
```


```graphql
mutation{
  add_message(message: {
    title: "Message title",
    content: "Content..."
  }){
     content
     title
  }
}
```

#### Edit a message

```header
Content-Type: application/json
Authorization: bearer <RECEIVED_JWT_TOKEN>
```


```graphql
 mutation{
    edit_message(
        message_id: 1,
        message: {
        title: "New title",
        content: "New content..."
    }){
        id
        content
        title
    }
  }
```

#### Delete a message

```header
Content-Type: application/json
Authorization: bearer <RECEIVED_JWT_TOKEN>
```


```graphql
 mutation{
  delete_message(message_id: 7)
 }
```
