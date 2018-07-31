require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Facebook::Messenger::Profile.set({
  persistent_menu: [
    {
      locale: 'default',
      composer_input_disabled: true,
      call_to_actions: [
        {
          title: 'My Account',
          type: 'nested',
          call_to_actions: [
            {
              title: 'What is a chatbot?',
              type: 'postback',
              payload: 'EXTERMINATE'
            },
            {
              title: 'History',
              type: 'postback',
              payload: 'HISTORY_PAYLOAD'
            },
            {
              title: 'Contact Info',
              type: 'postback',
              payload: 'CONTACT_INFO_PAYLOAD'
            }
          ]
        },
        {
          type: 'web_url',
          title: 'Get some help',
          url: 'https://github.com/jgorset/facebook-messenger',
          webview_height_ratio: 'full'
        }
      ]
    },
    {
      locale: 'zh_CN',
      composer_input_disabled: false
    }
  ]
}, access_token: EAADE0MAh5WMBAA45ZCgM2gcAuG1SDKarP25UiiNzRwjcAFG68ZBn2o4zMfDHX5ULaSNhSbR8U5CxwN0zaiL8XhojXOuPUK83RsCMkPgqua1D7K1pxW0TpfawPcVRW9OpQgVkbyrmhUEYv4S7Rnun1T8xZBPqr5o6mvIRYIbwAZDZD)

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