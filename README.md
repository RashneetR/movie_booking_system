# README

This README file documents the steps that are necessary to get this application up and running.

PREREQUISITES :
  Make sure you have Ruby 2.4.4, MongoDB shell version v4.0.3 and redis server installed.

GETTING STARTED :
1. Create a new folder called environment.
  $ mkdir environment

2. Navigate to your folder using 
   $ cd environment

3. Paste the downloaded file here, navigate to the file using 
  $ cd movie_booking_system
  Run $ bundle install

4. Run the rails server to check if your server is running properly 
  $ rails server 
Navigate to localhost:3000/ in your browser and you will see "Welcome aboard: You're riding Ruby on Rails!"

5.Run the following command to start mongo 
  $ mongo
 Create a database called movie_booking_system_development 
  > use movie_booking_system_development

6. Run the following command  in a new tab to start the redis server
  $ redis-server 

7.Run the following command in a new tab to start sidekiq
  $ bundle exec sidekiq -q default -q mailers 

NOTE : You will have to change the smtp mail settings to send mails from your email id. Follow rails guide for doing so.

8. Run the following to create an admin account
  $ rake db:seed(Now your application is up and running.)

Link of the problem statement and other application details : https://docs.google.com/document/d/128V1hgTvIjct2Faiu2sYTlqGClFOwBF-2uo2B1bhlgs/edit?userstoinvite=rashneetforsampleapp@gmail.com&ts=5bb4aed3#heading=h.z4gi10g1oohf

Feel free to contact rashneet@amuratech.com for any doubts related to the project and deployment.

Last Updated: 15th Nov 2018