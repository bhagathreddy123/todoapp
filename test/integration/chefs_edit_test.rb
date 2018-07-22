require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "bhagath", 
                        email: "bhagath@example.com",
                        password: "password", 
                        password_confirmation: "password")
   @admin_user = Chef.create!(chefname: "john1", 
                                  email: "john1@example.com",
                        password: "password", 
                      password_confirmation: "password", admin: true)  
  @chef2 = Chef.create!(chefname: "john", 
                                  email: "john@example.com",
                        password: "password", password_confirmation: "password")

  end
  
#   test "reject invalid chef edit" do
#   get edit_chef_path(@chef)
#   assert_template 'chefs/edit'
#   patch chef_path(@chef), params: { chef: { chefname: "", 

#                                               email: "bhagath@example.com " } } 
#   assert_template 'chefs/edit'
#   assert_select 'h2.panel-title'
#   assert_select 'div.panel-body'
# end

test "accept valid edit" do
  sign_in_as(@chef, "password")
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), 

                       params: { chef: { chefname: "bhagathreddy", 

                                   email: "bhagath@example1.com" } }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "bhagathreddy", @chef.chefname
    assert_match "bhagath@example1.com", @chef.email
  end
  
  test "redirect edit attempt by another non-admin user" do
    sign_in_as(@chef2, "password")
    updated_name = "joe"
    updated_email = "joe@example.com"
    patch chef_path(@chef), params: { chef: { chefname: "joe", 
                                  email: "joe@example.com" } }
    assert_redirected_to chefs_path
    assert_not flash.empty?
    @chef.reload
    assert_match "bhagath", @chef.chefname
    assert_match "bhagath@example.com", @chef.email
  end  
  
end
