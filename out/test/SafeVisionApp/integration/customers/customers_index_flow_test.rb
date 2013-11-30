require 'test_helper'

class CustomersIndexFlowTest < ActionDispatch::IntegrationTest
  def setup
    login
    @business_customer = create(:business_customer)
    @consumer_customer = create(:consumer_customer)
  end

  test 'should display customer list' do
    visit '/customers'
    within('#business-customers') do
      assert page.has_content?(@business_customer.display_name)
    end
    within('#consumer-customers') do
      assert page.has_content?(@consumer_customer.display_name)
    end
  end

  test 'should only display business customers' do
    visit '/customers'
    within('.customers_menu') do
      page.click_link('Business')
    end
    assert page.has_no_selector?('#consumer-customers')
    assert page.has_selector?('#business-customers')
    assert page.has_content?(@business_customer.display_name)
    assert page.has_no_content?(@consumer_customer.display_name)
  end

  test 'should only display consumer customers' do
    visit '/customers'
    within('.customers_menu') do
      page.click_link('Consumer')
    end
    assert page.has_selector?('#consumer-customers')
    assert page.has_no_selector?('#business-customers')
    assert page.has_no_content?(@business_customer.display_name)
    assert page.has_content?(@consumer_customer.display_name)
  end

  test 'should display show page when customer is clicked' do
    visit '/customers'
    within("#customer-row-#{@consumer_customer.id}") do
      click_link('View')
    end
    assert page.has_content?(@consumer_customer.display_name)
  end
end