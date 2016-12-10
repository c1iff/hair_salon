# Word Count

#### Ruby Week 3 Solo Assignment at Epicodus

#### By Chris Clifford

## Description

This app lets the add stylists and clients to a hair salon database.


## Setup/Installation Requirements

* Create database in PSQL with the following commands:
  CREATE DATABASE stylists;
  CREATE DATABASE hair_salon;
  CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, cosmetology_lic_number int)
  CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, stylist_id int);
  CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

* clone github repository
* go to the Terminal and in cloned repository type the bundle command
* Open a local server by entering: ruby app.rb
* Open the app the url: localhost:4567


##Specifications

* Home page displays a list of stylists.
  * The user can add a stylist to the list
* Users can add clients to the stylist
* Users can update and delete stylists
* Users can update and delete clients

## Known Bugs

No known bugs

## Support and contact details

cclifford82@gmail.com

## Technologies Used

* HTML
* CSS
* Ruby
* Sinatra
* Capybara

### License

HTML - Free Software Foundation, Inc. JavaScript - Free Software Foundation, Inc. CSS - Licensed under the MIT/X11 License Bootstrap - Code licensed MIT, docs CC BY 3.0, Currently v4.0.0-alpha.5. Ruby is copyrighted free software by Yukihiro Matsumoto <matz@netlab.jp>.

MIT License

Copyright (c) 2016 Chris Clifford

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
Copyright (c) 2016 Chris Clifford
