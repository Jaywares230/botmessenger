require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

#!/bin/sh
FB_ACCESS_TOKEN=$1

curl -X POST -H "Content-Type: application/json" -d '{
  "persistent_menu":[
    {
      "locale":"default",
      "composer_input_disabled":false,
      "call_to_actions":[
        {
          "title":"🌈 Sujets de discussion",
          "type":"nested",
          "call_to_actions":[
            {
              "title":"⭐️ Récents",
              "type":"postback",
              "payload":"TICK_latest_scheduled_state_machines_init"
            },
            {
              "title":"🎩 Au hasard",
              "type":"postback",
              "payload":"TICK_topic_hat_init"
            },
            {
              "title":"🔍 Liste",
              "type":"web_url",
              "url":"https://app.hellojam.fr/stories",
              "messenger_extensions":true
            }
          ]
        },
        {
          "title":"⚙️ Paramètres",
          "type":"nested",
          "call_to_actions":[
            {
              "title":"🔕 Gérer les notifications",
              "type":"postback",
              "payload":"MORNING_PUSH_SETTINGS"
            },
            {
              "title":"💕 Partager Jam",
              "type":"postback",
              "payload":"SHARE_BOT"
            },
            {
              "title":"📣 Donner son avis",
              "type":"postback",
              "payload":"FEEDBACK_WORKFLOW"
            },
            {
              "title":"☝️ Aide",
              "type":"postback",
              "payload":"HELP"
            },
            {
              "title":"💾 Mes données",
              "type":"web_url",
              "url":"https://www.hellojam.fr/privacy_policy"
            }
          ]
        }
      ]
    }
  ]
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=$FB_ACCESS_TOKEN"




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

