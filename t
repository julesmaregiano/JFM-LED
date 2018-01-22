[1mdiff --git a/app/controllers/manager/users_controller.rb b/app/controllers/manager/users_controller.rb[m
[1mindex 04bb1b7..0d9bfe6 100644[m
[1m--- a/app/controllers/manager/users_controller.rb[m
[1m+++ b/app/controllers/manager/users_controller.rb[m
[36m@@ -6,6 +6,6 @@[m [mclass Manager::UsersController < ApplicationController[m
 [m
   def index[m
     @user = current_user[m
[31m-    @users = User.all[m
[32m+[m[32m    @users = User.where(role: [1, 2, 3]).sort_by(&:company)[m
   end[m
 end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex 5b8c28d..fa16f27 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -17,4 +17,12 @@[m [mclass User < ApplicationRecord[m
 [m
   enum role: [:particulier, :pro, :technician, :manager, :admin][m
 [m
[32m+[m[32m  scope :work_next_week, -> { joins(:availabilities).where("date < ?", Date.today + 5)}[m
[32m+[m[32m  scope :remove_past_availabilities, -> { joins(:availabilities).where("date > ?", Date.today)}[m
[32m+[m
[32m+[m[32m  def remove_unavailable[m
[32m+[m[32m    self.work_next_week[m
[32m+[m[32m        .remove_past_availabilities[m
[32m+[m[32m  end[m
[32m+[m
 end[m
[1mdiff --git a/app/views/manager/bookings/edit.html.erb b/app/views/manager/bookings/edit.html.erb[m
[1mindex 54b9050..371146a 100644[m
[1m--- a/app/views/manager/bookings/edit.html.erb[m
[1m+++ b/app/views/manager/bookings/edit.html.erb[m
[36m@@ -4,7 +4,7 @@[m
   <div class="dashboard-content">[m
     <div class="padding-box">[m
       <div id="events_calendar">[m
[31m-        <%= render "shared/week_calendar", availabilities: @availabilities, techs: @techs %>[m
[32m+[m[32m        <%= render "shared/week_calendar", availabilities: @availabilities, techs: @techs.work_next_week %>[m
       </div>[m
       <div class="row card-container">[m
         <h4><strong>Bookings à valider</strong></h4>[m
[1mdiff --git a/app/views/shared/_reports_table.html.erb b/app/views/shared/_reports_table.html.erb[m
[1mindex 7187fd2..60135d6 100644[m
[1m--- a/app/views/shared/_reports_table.html.erb[m
[1m+++ b/app/views/shared/_reports_table.html.erb[m
[36m@@ -17,7 +17,7 @@[m
       <% reports.each do |report| %>[m
         <tr>[m
           <th scope="row"><%= report.booking.reference %></th>[m
[31m-          <td><%= report.created_at %></td>[m
[32m+[m[32m          <td><%= report.created_at.strftime("%d/%m/%y") %></td>[m
           <td><%= report.booking.address %></td>[m
           <td><%= report.user.first_name + ' ' + report.user.last_name %></td>[m
           <td><%= report.booking.availabilities.count %> demi-journées</td>[m
[1mdiff --git a/app/views/shared/_users_table.html.erb b/app/views/shared/_users_table.html.erb[m
[1mindex d6b607c..dca5acf 100644[m
[1m--- a/app/views/shared/_users_table.html.erb[m
[1m+++ b/app/views/shared/_users_table.html.erb[m
[36m@@ -2,7 +2,7 @@[m
   <table class="table table-hover">[m
     <thead>[m
       <tr>[m
[31m-        <th scope="col">#</th>[m
[32m+[m
         <th scope="col">Nom</th>[m
         <th scope="col">Role</th>[m
         <th scope="col">Entreprise</th>[m
[36m@@ -12,7 +12,7 @@[m
     <tbody>[m
       <% users.each do |user| %>[m
         <tr>[m
[31m-          <th scope="row"><%= user.id %></th>[m
[32m+[m
           <td><%= user.first_name %> <%= user.last_name %></td>[m
           <td><%= user.role %></td>[m
           <td><%= user.company.name %></td>[m
