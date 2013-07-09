require 'test_helper'

class RoutesTestTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  test "the first photo" do
    assert_generates "/photos/1", { :controller => "photos", :action => "show", :id => "1" }
  end

  test "Has an about page" do
    assert_generates "/about", {:controller => "pages", :action => "show"}
  end

  test "fleet has ships and ships have pirates" do
    assert_generates "/ships/1/pirates/2", {:controller => "pirates", :action => "show", :ship_id => 1, :id => 2}
  end

  test "creates a new ship pirate" do
    assert_generates new_ship_path, {:controller => "ships", :action => "new"}
  end

  test "You should be able to find a ship by its name" do
    assert_generates "/ships/black-pearl", {:controller => "ships", :action => "show", :id => "black-pearl"}
  end

  test "Access a pirate's page with his/her name" do
    assert_generates "/black-beard", {:controller => "pirates", :action => "show", :name => "black-beard"}
  end

  test "Should be able to access all the ships in a fleet" do
    assert_generates "/fleets/1", {:controller => "ships", :action => "filtered", :id => "1"}
  end

  test "should list all parent_companies" do
    assert_generates parent_companies_path, {:controller => "parent_companies", :action => "index"}
  end

  test "should edit a parent_company" do
    assert_generates edit_parent_company_path(1), {:controller => "parent_companies", :action => "edit", :id => "1"}
  end

  test "should show a parent_company" do
    assert_generates parent_company_path(1), {:controller => "parent_companies", :action => "show", :id => "1"}
  end

  test "should show a subsidiary company" do
    assert_generates parent_company_subsidiary_path(1,3), {:controller => "subsidiaries", :action => "show", :parent_company_id => "1", :id => 3}
  end

  test "should show all subsidiary companies" do
    assert_generates parent_company_subsidiaries_path(1), {:controller => "subsidiaries",:parent_company_id => 1,:action => "index"}
  end

  test "should delete a subsidiary company" do
    assert_generates '/parent_companies/1/subsidiaries/3', {:controller => "subsidiaries", :action => "destroy", :parent_company_id => "1", :id => "3"}
  end

  test "should update an employees record" do
    assert_generates '/parent_companies/1/subsidiaries/3/employees/10', {:controller => "employees", :action => "update", :parent_company_id => "1", :subsidiary_id => "3", :id => "10"}
  end

  test "should create a new employee using create" do
    assert_generates '/parent_companies/1/subsidiaries/10/employees', {:controller => "employees", :action => "create", :parent_company_id => "1", :subsidiary_id => "10"}
  end

  test "should create a new employee using new" do
    assert_generates new_parent_company_subsidiary_employee_path(1,10), {:controller => "employees", :action => "new", :parent_company_id => "1", :subsidiary_id => "10"}
  end

  test "should show all the employees in a company" do
    assert_generates parent_company_subsidiary_employees_path(1,10), {:controller => "employees", :action => "index", :parent_company_id => "1", :subsidiary_id => "10"}
  end

  test "should show all the employees in a PARENT company" do
    assert_generates '/parent_companies/1/employees', {:controller => "parent_companies", :action => "show_employees", :id => "1"}
  end


end
