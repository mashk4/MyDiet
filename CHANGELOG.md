# 1.7.0 - 2022-09-14
  * Added:
    * Model, Controller and Integration tests;
    * Fixed some bugs;

# 1.6.0 - 2022-09-10
  * Added:
    * Ability to enable/disable getting daily/weekly/monthly reports;
    * Weekly/monthly reports;

# 1.5.0 - 2022-09-08
 * Added:
    * Mailers;
    * Background processing with Sidekiq;
    * Reset password mail;
    * Report Mailer that sends email with eaten meals statistic;
    * Daily Report Mailer that sends eaten meals statistic everyday at 10 pm (using Sidekiq-cron) and compares it with the previous day;

# 1.4.0 - 2022-09-04
 * Added:
    * Roles: admin and basic user;
    * Dashboard for admin with all users. Admin can now export and import users in xlsx format. Import should be as zip file. The structure for importing users in xlsx format for each row is

    `name | email | password`

    * Policies with help of Pundit gem.

# 1.3.0 - 2022-09-01
 * Added:
    * EatenProduct entity and some stats.

# 1.2.0 - 2022-08-30
 * Added:
    * Meal entity and associations with Diet entity;
    * Possibility to select multiple meals in a diet;
    * Flatpickr as calendar;
    * Select2 as select box when adding meals for a diet;
    * Checking how many calories and nutrients you consume in each diet.

# 1.1.0 - 2022-08-27
 * Added:
    * Diet entity: model, view, controller;
    * Search by Diet;
    * Error Handling.

# 1.0.0 - 2022-08-26
  * Initial verison:
    * Added basic UI, sign in/up buttons and mechanism to sign in/up, log out with help of desive gem.