# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<!-- Querry References - 
{
  users {
    id
    name
    email
    postCount
  }
}

{
  user(id: 2){
    id
    name
    email
    postCount
    posts{
      title
      body
    }
  }
}

mutation{
  createUser(input:{
    name: "test",
    email: "test@example.com"
  })
  {
     user{
          id,
          name
         }
    errors
  }
 
}
 --># learn_graphql
