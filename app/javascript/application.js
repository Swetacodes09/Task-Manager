// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

import Rails from "@rails/ujs";
Rails.start();

import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import '../stylesheets/application';