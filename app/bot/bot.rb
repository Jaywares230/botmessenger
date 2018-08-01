require 'facebook/messenger'
include Facebook::Messenger
require "dotenv"
Dotenv.load

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Facebook::Messenger::Profile.set({
  greeting: [
    {
      locale: 'default',
      text: 'Welcome to your new bot overlord!'
    },
    {
      locale: 'fr_FR',
      text: 'Bienvenue dans le bot du Wagon !'
    }
  ]
}, access_token: ENV['ACCESS_TOKEN'])


Bot.on :message do |message|
  message.reply(text: 'Hello, human! #{ENV["ACCESS_TOKEN"]}')
  message.reply(
  attachment: {
    type: 'template',
    payload: {
      template_type: 'button',
      text: 'Human, do you like me?',
      buttons: [
        { type: 'postback', title: 'Yes', payload: 'HARMLESS' },
        { type: 'postback', title: 'No', payload: 'EXTERMINATE' }
      ]
    }
  }
)
end

