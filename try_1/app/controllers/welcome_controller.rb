class WelcomeController < ApplicationController
  def hello_from_view
  end

  def hello_instance_view
    @hello="hello worlds"
  end

  def hello_without_view
    render :text => "hello worlds"
  end


end
