class ExampleJob < ApplicationJob
  queue_as :default
  #queue_as :low_priority
#self.queue_adapter = :resque
around_perform :around_example

rescue_from(ActiveRecord::RecordNotFound) do |exception|
  logger.info 'Exception found'
end
  def perform(*args)
    sleep 10
    logger.info "Just waited 10 seconds."
    # Do something later
  end
  private
  #callbacks
    def around_example
      logger.info 'around before perform'
      yield
      logger.info 'around afetr perform'
    end
end
