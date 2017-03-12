## Assignment for Module #3: Recipe Finder

The overall goal of this assignment is to implement a Rails application using model,
view, and controller classes.

  * the model class will access information
  * the view class will display information and accept commands from the user
  * the controller class will implement actions through internal service logic
    and the delegation to model and view classes.

The functional goal is to provide web page access to recipe information
served by `http://food2fork.com/api` through JSON and images. Documentation for the 
API can be found at http://food2fork.com/about/api.

### Functional Requirements

You are tasked with creating a Rails app that will display a recipe
index page based on a search keyword entered.  

  * the user will supply a keyword to search for 
  * the Rails app will pass that query to `http://food2fork.com/api` and accept the
    results
  * the Rails app will build a web page display of the results and accept the next keyword
    search
  * the web page displayed will provide HTML links to more detailed recipe information
    from other web sites.

You should already have the `Recipe` class from an earlier
assignment. (Remember, that unlike in that assignment - you will not
need to `require` HTTParty gem in your code, since loading HTTParty gem
should be the Bundler's job.)

You are also tasked with deploying your solution to Heroku - to be accessed by 
friends, family, other students, co-workers, and prospective employers.

### Getting Started

1. Create a new Rails application using the `rails` command called `recipefinder`.

2. Download and extract the starter set of boostrap files into the recipefinder directory.

    * replace the generated Gemfile with the Gemfile from the bootstrap fileset
    * run the `bundle` command to resolve new gems 

    ```shell
    |-- Gemfile
    |-- README.md
    |-- .rspec (important hidden file)
    `-- spec
        |-- recipes_app_spec.rb
        `-- spec_helper.rb
    ```

3. Install the following gems used by the rspec unit tests. You may have
some of these already installed. The last gem is used for headless 
web page testing.

    ```shell
    $ gem install rspec
    $ gem install rspec-its
    $ gem install capybara
    $ gem install poltergeist
    ```

4. Make sure phantomJS is installed and in your bin PATH on your system
($ phantomjs --version). This binary is used by the `poltergeist`
gem to implement a headless unit test for the Web interface.  You can
interact with your Rails app directly using a browser without this
library. It is only needed by the rspec tests to provide you feedback
for example criteria the grader will be looking for later when submitted.
PhantomJS installation was covered in Module 1. In case you need more information, 
the download URLs are below.  Linux users will need to use version 1.9.8
or build from source. All other platforms can easily use 2.0.0.

    * phantomjs downloads: http://phantomjs.org/download.html
    * bitbucket: https://bitbucket.org/ariya/phantomjs/downloads

5. Run the rspec test(s) to receive feedback. They must be run from their location at the 
root of your rails application. All tests will (obviously) fail until you complete the specified solution.

    ```shell
    Finished in 1.69 seconds (files took 0.41211 seconds to load)
    8 examples, 8 failures

    Failed examples:

    rspec ./spec/recipes_app_spec.rb:6 # Recipes App displays 
        'Kahlúa-Spiked' when request parameter 'search' is mocha
    rspec ./spec/recipes_app_spec.rb:11 # Recipes App utilizes 
        the FOOD2FORK_SERVER_AND_PORT environment variable
    rspec ./spec/recipes_app_spec.rb:16 # Recipes App utilizes 
        the FOOD2FORK_KEY environment variable
    rspec ./spec/recipes_app_spec.rb:24 # Recipes App visit root 
        displays chocolate (default)
    rspec ./spec/recipes_app_spec.rb:28 # Recipes App visit root 
        displays 'Powered By Food2Fork.com'
    rspec ./spec/recipes_app_spec.rb:32 # Recipes App visit root 
        displays table element that has a row with 3 columns
    rspec ./spec/recipes_app_spec.rb:36 # Recipes App visit root 
        column 1 should have the thumbnail inside img tag inside a link tag
    rspec ./spec/recipes_app_spec.rb:40 # Recipes App visit root 
        title should be inside a second column inside a link tagink tag
    ```

6. Implement your Rails app solution and use the rspec tests to help 
verify your completed Rails app solution.

7. (Optional) Post your Rails app solution to Heroku.

8. Submit your Rails app solution for grading.
