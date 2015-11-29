Feature: Acount administrator
  As user admin
  I want login in the site as administrator

Background:
  Given one account email: "admin@admin.com" and password: "Admin123"

Scenario: Login as administrator
  Given the login page
  When fill fields with email: "admin@admin.com" and password: "Admin123"
  And press button "Login"
  Then login as administrator should see message "User administrator"