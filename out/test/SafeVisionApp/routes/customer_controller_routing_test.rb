require 'test_helper'

class CustomerControllerRoutingTest < ActionController::TestCase
  def setup
    @customer = create(:consumer_customer)
  end

  test 'should route to customers index' do
    assert_routing '/customers', {controller: 'customers', action: 'index'}
  end

  test 'should route to new customer path' do
    assert_routing '/customers/new', {controller: 'customers', action: 'new'}
  end

  test 'should route to customer path' do
    assert_routing "/customers/#{@customer.id}", {controller: 'customers', action: 'show', id: "#{@customer.id}"}
  end

  test 'should route to customers create' do
    assert_routing({method: 'post', path: '/customers'}, {controller: 'customers', action: 'create'})
  end

  test 'should route to edit customer path' do
    assert_routing "/customers/#{@customer.id}/edit", {controller: 'customers', action: 'edit', id: "#{@customer.id}"}
  end

  test 'should route to update customer path' do
    assert_routing({method: 'put', path: "/customers/#{@customer.id}"}, {controller: 'customers', action: 'update', id: "#{@customer.id}"})
  end

  test 'should route to search path' do
    assert_routing '/customers/search', {controller: 'customers', action: 'search'}
  end

  test 'should route to search_criteria' do
    assert_routing '/customers/criteria_search', {controller: 'customers', action: 'criteria_search'}
  end
end
