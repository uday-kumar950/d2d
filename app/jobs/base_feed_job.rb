class BaseFeedJob 
  include SuckerPunch::Job 
  workers 5

  def perform(params_hash, raw_post_data)
    Rails.logger.info("BaseFeedJob STARTED - #{raw_post_data}")
    ActiveRecord::Base.connection_pool.with_connection do
      puts AllygatorShuttle.new(params_hash, raw_post_data).process
    end
    Rails.logger.info("BaseFeedJob DONE - #{raw_post_data}")
  end
  
end
