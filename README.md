# Tumblr Associations

## Instructions

You've been contracted as a back-end developer for Tumblr, the world's most popular blogging platform. They're migrating to a Sinatra application and need your help setting up the schema. 

Follow along with the instructions below - run `learn` to check your work. 

### Step 1 - Models

Create three models - User, Post, and Comment. A post belongs to a user and has many comments. A user has many posts and has many comments. A comment belongs to a post and belongs to a user. ActiveRecord will allow us to setup the relationship this way.

### Step 2 - All About That Database

Create three migrations to create a table for users, posts, and comments. Users should have two columns, `username` and `email`. Posts should have `title`, `content`, and `user_id`, because a post belongs to a user. Comments should have `content`, `user_id`, and `post_id`. 

NOTE: Once you've created your migrations, run `rake db:migrate SINATRA_ENV=test` to migrate your database for the test environment. 

## Bonus

One of the cool features of Tumblr is the ability to tag posts - then we can see all the posts about funny cats or superman. A post can have many different tags, but a tag also has many posts. For this relationship to work, we need a join table - a table in between to keep track of the associations. Read more about join tables [here](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association). 

Create two new models and two new tables - one to represent a tag, and one to represent the join table.
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/hs-tumblr-associations' title='Tumblr Associations'>Tumblr Associations</a> on Learn.co and start learning to code for free.</p>
