require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @business_customer = create(:business_customer)
    @consumer_customer = create(:consumer_customer)
  end

  test 'should not save without business flag' do
    customer = build(:consumer_customer, business_flag: nil)
    assert !customer.save, 'Saved customer without business flag'
  end

  test 'should not save when phone number is invalid' do
    customer = build(:consumer_customer, phone_number: '123')
    assert !customer.save, 'Saved customer without invalid phone number'
  end

  test 'should not save when fax number is invalid' do
    customer = build(:consumer_customer, fax_number: '123')
    assert !customer.save, 'Saved customer with invalid fax number'
  end

  test 'should not save without buinsess name if business flag is true' do
    customer = build(:business_customer, business_name: nil)
    assert !customer.save, 'Saved business customer without business name'
  end

  test 'should not save without first and last name if business flag is false' do
    customer = build(:consumer_customer, first_name: nil, last_name: nil)
    assert !customer.save, 'Saved private customer without first and last name'
  end

  test 'should not save with invalid email' do
    customer = build(:business_customer, email: 'fooo')
    assert !customer.save, 'Saved customer with invalid email'
  end

  test 'should not return consumer customers' do
    compare_query_results(@business_customer, Customer.business_customers)
  end

  test 'should not return business customers' do
    compare_query_results(@consumer_customer, Customer.consumer_customers)
  end

  test '#display_name should display proper name for consumer' do
    assert_equal "#{@consumer_customer.first_name} #{@consumer_customer.last_name}", @consumer_customer.display_name
  end

  test '#display_name should display proper name for business' do
    assert_equal @business_customer.business_name, @business_customer.display_name
  end

  test 'should return results with last_name like' do
    compare_query_results(@consumer_customer, Customer.last_name_like(@consumer_customer.last_name[0]))
  end

  test 'should return results with business_name like' do
    compare_query_results(@business_customer, Customer.business_name_like(@business_customer.business_name[0]))
  end

  private
    def compare_query_results(customer, results)
      assert_equal 1, results.size
      assert_equal customer, results.first
    end
end
