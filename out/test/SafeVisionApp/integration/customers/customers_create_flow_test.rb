require 'test_helper'

class CustomersFlowTest < ActionDispatch::IntegrationTest
  def setup
    login
  end

  test 'should display new customer form' do
    visit '/customers/new'
    within('#new-customer') do
      assert page.find_field('Business customer')
      assert page.find_field('Consumer customer')
      assert page.find_field('Business name')
      assert page.find_field('First name')
      assert page.find_field('Last name')
      assert page.find_field('Email')
      assert page.find_field('Phone number')
      assert page.find_field('Fax number')
      assert page.find_button('Create Customer')
    end
  end

  test 'should create new business customer and display it' do
    customer = build(:business_customer)
    visit '/customers/new'
    within('#new-customer') do
      choose('Business customer')
      fill_in('Business name', with: customer.business_name)
      fill_in('Email', with: customer.email)
      fill_in('Phone number', with: customer.phone_number)
      fill_in('Fax number', with: customer.fax_number)
      click_button('Create Customer')
    end
    assert page.has_content?(customer.business_name)
    assert page.has_content?(customer.email)
    assert page.has_content?(customer.phone_number)
    assert page.has_content?(customer.fax_number)
  end

  test 'should create new consumer customer and display it' do
    customer = build(:consumer_customer)
    visit '/customers/new'
    within('#new-customer') do
      choose('Consumer customer')
      fill_in('First name', with: customer.first_name)
      fill_in('Last name', with: customer.last_name)
      fill_in('Email', with: customer.email)
      fill_in('Phone number', with: customer.phone_number)
      fill_in('Fax number', with: customer.fax_number)
      click_button('Create Customer')
    end
    assert page.has_content?("#{customer.first_name} #{customer.last_name}")
    assert page.has_content?(customer.email)
    assert page.has_content?(customer.phone_number)
    assert page.has_content?(customer.fax_number)
  end

end