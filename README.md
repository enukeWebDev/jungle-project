# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

The main purpose of this project is to simulate the real world scenario. I was hired as a junior developer and was given a task to complete a project by doing my own research using a software language that I have no prior experience. For this project, I was assigned to work on the following feautures of the application using Ruby on Rails.

  - categories page
  - admin dashboard page
  - home page
  - order details page
  - sold out badge
  - allowing admins to create a new categories for products
  - user authentication

I was also given the instructions to perform tests using rspec and capybara for the following:

  - testing user login/signup
  - testing homepage and links
  - testing add to cart functionality

Lastly, I was given an instructions to fix some bugs on the following:

  - add missing admin security
  - prevent users from checking out without an empty cart
  - prevent priovate users from adding categories and products

It was a very challenging project but I was able to finish the work that was assinged to me and was able to submit the project on time. 

## Some Screenshots of the Project After Completion

1. !["dashboard"](https://github.com/enukeWebDev/jungle-project/blob/master/app/docs/Dashboard.png?raw=true)

2. !["sold out"](https://github.com/enukeWebDev/jungle-project/blob/master/app/docs/Sold_Out.png?raw=true)

3. !["admin security"](https://github.com/enukeWebDev/jungle-project/blob/master/app/docs/Admin-Security.png?raw=true)

4. !["add category"](https://github.com/enukeWebDev/jungle-project/blob/master/app/docs/Add_Category1.png?raw=true)


## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
