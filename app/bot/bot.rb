require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

{
  "persistent_menu":[
    {
      "locale":"default",
      "composer_input_disabled": true,
      "call_to_actions":[
        {
          "title":"My Account",
          "type":"nested",
          "call_to_actions":[
            {
              "title":"Pay Bill",
              "type":"postback",
              "payload":"PAYBILL_PAYLOAD"
            },
            {
              "type":"web_url",
              "title":"Latest News",
              "url":"https://www.messenger.com/",
              "webview_height_ratio":"full"
            }
          ]
        }
      ]
    }
  ]
}

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

