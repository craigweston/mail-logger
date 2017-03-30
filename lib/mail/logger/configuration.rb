class Mail::Logger::Configuration
  attr_accessor :log_path, :log_file_name, :include_body

  def initialize
    self.log_path = rails_log_path || File.expand_path("./log")
    self.log_file_name = rails_log_file_name || "mail.log"
    self.include_body = false
  end

  alias :include_body? :include_body

  def rails_log_path
    return nil unless defined? Rails
    Rails.root.join("log")
  end

  def rails_log_file_name
    return nil unless defined? Rails
    "mail_#{Rails.env}.log"
  end
end
