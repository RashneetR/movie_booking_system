# README

This README file documents the steps that are necessary to get this
application up and running.

1. Make sure you have Ruby 2.4.4 and rails 5.2.1 installed.

2. Create a new folder called environment.
  $ mkdir environment

3. Navigate to your folder using 
   $ cd environment

4. Create a new rails application called movie_booking_system 
  $ rails new movie_booking_system

5. Run the rails server to check if your server is running properly 
  $ rails server 
  Navigate to localhost:3000/ in your browser and you will see "Welcome aboard: You're riding Ruby on Rails!"

6. Navigate to movie_booking_system using
  $ cd movie_booking_system 
  Paste all the files from downloaded folder here 

7. Make sure you have MongoDB shell version v4.0.3
  run the following command to start mongo 
  $ mongo
  Create a database called movie_booking_system_development 
  > use movie_booking_system_development

8. Run command bundle install and restart the server 
  $ bundle install
  $ rails s

9. Make sure you have redis server installed. Run the following command in a new tab
  $ redis-server 

10. Run the following command in a new tab to start sidekiq
  $ bundle exec sidekiq -q default -q mailers 

NOTE : You will have to change the smtp mail settings to send mails from your email id. Follow rails guide for doing so.

11. Run the following to create an admin account
  $ rake db:seed(Now your application is up and running.)

12. Run the command to check if all the tests run
 $ rails test

Link of the problem statement and other application details : https://docs.google.com/document/d/128V1hgTvIjct2Faiu2sYTlqGClFOwBF-2uo2B1bhlgs/edit?userstoinvite=rashneetforsampleapp@gmail.com&ts=5bb4aed3#heading=h.z4gi10g1oohf
Feel free to contact rashneet@amuratech for any doubts related to the project and deployment.