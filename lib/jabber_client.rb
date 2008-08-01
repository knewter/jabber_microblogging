class JabberClient
  attr_accessor :client, :login

  def initialize(login, pass)
    @login  = login
    @client = Jabber::Simple.new(login, pass)
  end

  def handle_async_messaging
    while(true) do
      sleep(1)
      handle_received_messages
    end
  end

  def handle_received_messages
    if @client.received_messages?
      the_messages = @client.received_messages.map do |message|
        { :from => message.from.to_s.gsub(/'/, ''), :content => message.body.gsub(/'/, '') } # FIXME: Need to keep tickmarks at some point.
      end
      the_messages.each do |message|
        MicroblogPost.create(message)
      end
    end
  end
end

