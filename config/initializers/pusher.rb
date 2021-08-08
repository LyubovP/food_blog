require 'pusher'

pusher = Pusher::Client.new(
  app_id: '1246822',
  key: '296f471c7c38350ad2e6',
  secret: '18e8e73bdbe92c84e39c',
  cluster: 'us3',
  encrypted: true
)

pusher.trigger('my-channel', 'my-event', {
  message: 'hello world'
})