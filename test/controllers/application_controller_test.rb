class TestApplicationControllerTest < ActionController::TestCase

end

class TestApplicationController < ApplicationController
  def test
    render :text => 'text'
  end
end