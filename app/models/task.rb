class Task < ActiveRecord::Base
  require 'net/http'
  require 'json'
  belongs_to :user
  attr_accessible :description, :tag, :duration, :start, :estimated_time, :actual_time

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
    puts response.body
  end

  def start_task
    self.start = Time.now
    self.save
  end

  def finish_task(time_elapsed)
    self.finished = true
    self.actual_time = time_elapsed
    self.save
  end
end
