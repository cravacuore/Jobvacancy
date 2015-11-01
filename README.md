[![Build Status](https://snap-ci.com/nicopaez/job-vacancy/branch/develop/build_image)](https://snap-ci.com/nicopaez/job-vacancy/branch/develop) [![Build Status](https://travis-ci.org/GianFF/Jobvacancy.svg?branch=master)](https://travis-ci.org/GianFF/Jobvacancy)
---

Job Vacancy Application
=======================

---

___
### Members:

Developer team:
* Gian Franco Fioriello : gf.fioriello@gmail.com
* Alejandro Sobko : alejandro.sobko@gmail.com
* Emmanuel Pericon : brianpericon.e92@gmail.com

Product Owner:
* Nicolas Paez : nicopaez@computer.org

---

### Backlog:
https://trello.com/b/tFVioHoT/jobvacancy

___

---
###### To contribute with this repository, you might want to follow this configurations.


### Initial Configurations
Once you have clone this repository, follow these steps to start working:

* Step into the project.
* Run **_rvm current_**
* Run **_rvm gemset use jobvacancy_**, to create a gemset for the project that do not interfere with the local gems.
* Run **_bundle install --without staging production_**, to install all application dependencies
* If you have problems with postgres, and you are working on Linux then run **sudo apt-get install postgresql-9.3 postgresql-server-dev-9.3 libpq-dev** to install postgresql, the dev libraries and the postgres server dev headers.
* Run **_bundle exec rake_**, to run all tests and ensure everything is properly setup
* Run **_PADRINO_ENV=development bundle exec padrino rake db:migrate_**, to setup the development database
* Run **_bundle exec padrino start_**, to start the application

Some conventions to work on it:

* Follow existing coding conventions
* Use feature branch
* Add descriptive commits messages in English to every commit
* Write code and comments in English
* Use REST routes

---

##### TODO: Configurate Coverall (https://coveralls.io)