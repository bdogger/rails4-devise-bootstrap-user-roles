require 'test_helper'

class CustomersIndexFlowTest < ActionDispatch::IntegrationTest
  def setup
    login
    @business_customer = create(:business_customer)
    @consumer_customer = create(:consumer_customer)
  end

  test 'should go to edit page of business customer' do
    view_customer(@business_customer)
    assert page.has_css?("input[value='#{@business_customer.display_name}']")
  end

  test 'should go to edit page of consumer customer' do
    view_customer(@consumer_customer)
    assert page.has_css?("input[value='#{@consumer_customer.first_name}']")
    assert page.has_css?("input[value='#{@consumer_customer.last_name}']")
  end

  test 'should edit customer and display new information' do
    view_customer(@consumer_customer)
    page.fill_in('First name', with: 'Boo')
    page.fill_in('Last name', with: 'Radley')
    page.fill_in('Email', with: 'boo@radley.com')
    click_button('Update Customer')
    assert page.has_content?('Boo Radley')
    assert page.has_content?('boo@radley.com')
  end

  test 'should remain on edit page with invalid information' do
    view_customer(@consumer_customer)
    page.fill_in('First name', with: '')
    click_button('Update Customer')
    assert page.has_content?('Edit Customer')
  end


  private
  def view_customer(customer)
    visit '/customers'
    within("#customer-row-#{customer.id}") do
      click_link('Edit')
    end
  end

end