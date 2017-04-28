class GreetingsController < ApplicationController
  def hello
        render html: "Hello, World!"
  end
end
