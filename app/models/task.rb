class Task < ActiveRecord::Base
  require 'net/http'
  require 'json'
  belongs_to :user
  attr_accessible :description, :tag, :duration, :start

  def analyze
    @host = 'estimately.cloudapp.net'
    @port = '5000'
    @path = '/'

    @body = {'current_task' => self, 'past_tasks' => self.user.tasks}.to_json
    puts 'here'

    initheader={'Content-Type' =>'application/json'}
    request = Net::HTTP::Post.new(@path, initheader)
    request.body = @body
    response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
    puts response
  end
end
