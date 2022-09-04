# 1.2.0 - 2022-08-30
 * Added:
    * Roles: admin and basic user;
    * Dashboard for admin with all users. Admin can now export and import users in xlsx format. The structure for importing users in xlsx format for each row is

    `name | email | password`;

    * Policies with help of Pundit gem.

# 1.2.0 - 2022-08-30
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