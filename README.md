## Getting Started


- Pull down this repo
- $bundle install
- $rake test
- You should see failing tests

### The test file is located at 'test/integration/routes_test_test.rb'

## Your Task:

- Write all the neccessary routes to make the tests pass!

### Example:

You can make the first test pass at least two ways:

````ruby
  resources :photos
````
OR

````ruby
  get '/photos/:id' => 'photos#show'
````

### Note:

We are no longer using fis/test. This is your first intro to Test::Unit and MiniTest, the default testing libraries for rails.

One major difference is that there are new assertions, below are some links to introduce you to them.

[Test::Unit]("http://ruby-doc.org/stdlib-2.0/libdoc/test/unit/rdoc/Test/Unit/Assertions.html")
[MiniTest]("http://www.ruby-doc.org/gems/docs/h/http_router-0.10.2/MiniTest/Unit/TestCase.html")

Also, Tests are run in a random order so pay attention to the names of the tests to find them in the test run
