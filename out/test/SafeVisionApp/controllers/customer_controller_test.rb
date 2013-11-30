require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
    @customer = create(:consumer_customer)
    @business_customer = create(:business_customer)
  end

  test 'should return index on get to customers path' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    @bar = create(:user)
    sign_in @bar
    @customer = create(:consumer_customer)
    @business_customer = create(:business_customer)
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:business_customers)
    assert_not_nil assigns(:consumer_customers)
  end

  test 'should return new on get to new customer path' do
    get :new
    assert_template :new
    assert_not_nil assigns(:customer)
  end

  test 'should return show on get to customer path' do
    get :show, id: @customer.id
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:customer)
  end

  test 'should redirect to customer_path on post to create' do
    post :create, customer: attributes_for(:business_customer)
    assert_response :redirect
    assert_not_nil assigns(:customer)
  end

  test 'should return new on post to create with errors' do
    post :create, customer: attributes_for(:business_customer, business_name: '')
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:customer)
  end

  test 'should return edit on get to edit' do
    get :edit, id: @customer.id
    assert_response :success
    assert_template :edit
    assert_not_nil assigns(:customer)
  end

  test 'should redirect to show on put to update' do
    put :update, id: @customer.id, customer: attributes_for(:consumer_customer)
    assert_response :redirect
    assert_not_nil assigns(:customer)
  end

  test 'should return edit put to update with errors' do
    put :update, id: @customer.id, customer: attributes_for(:consumer_customer, first_name: '')
    assert_response :success
    assert_template :edit
    assert_not_nil assigns(:customer)
  end

  test 'should return search page on get to search' do
    get :search
    assert_response :success
    assert_template :search
  end

  test 'should return criteria_search page on get to criteria_search' do
    get :criteria_search, last_name: @customer.last_name
    assert_response :success
    assert_template :criteria_search
    assert_not_nil assigns(:consumer_customers)
  end

  test 'should return criteria_search page on get to criteria_search with business customer' do
    get :criteria_search, business_name: @business_customer.business_name
    assert_response :success
    assert_template :criteria_search
    assert_not_nil assigns(:business_customers)
  end
end