# README

This README file documents the steps that are necessary to get this application up and running.

PREREQUISITES :
- Ruby 2.4.4
- MongoDB v4.0.3 
- Redis server

GETTING STARTED :
1. Run the following command to clone the project repository
   $ git clone

2. Navigate to your project folder and run bundle  
   $ cd project_name && bundle

3. Run the following to create an admin account in your mongo database
    $ rake db:seed

3. Run the rails server to check if your server is running properly 
  $ rails server 

4. Run the following command  in a new tab to start the redis and sidekiq
  $ redis-server 
  $ bundle exec sidekiq -q default -q mailers

NOTE : You will have to change the smtp mail settings to send mails from your email id. Follow rails guide for doing so.

Now your application is up and running

Link of the problem statement and other application details : https://docs.google.com/document/d/128V1hgTvIjct2Faiu2sYTlqGClFOwBF-2uo2B1bhlgs/edit?userstoinvite=rashneetforsampleapp@gmail.com&ts=5bb4aed3#heading=h.z4gi10g1oohf

Feel free to contact rashneet@amuratech.com for any doubts related to the project and deployment.

Last Updated: 20th Nov 2018