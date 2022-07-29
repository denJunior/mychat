# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin 'websocket', preload: true
pin 'consumer', preload: true
pin 'my_channel', preload: true
pin 'create_dom_elements', preload: true
pin 'bootstrap', preload: true
pin '@popperjs/core', to: '@popperjs--core.js', preload: true
pin 'mdb-ui-kit', preload: true
pin 'jquery', preload: true
pin 'turbolinks', preload: true
pin '@rails/activestorage', to: '@rails--activestorage.js', preload: true
pin '@rails/ujs', to: '@rails--ujs.js', preload: true
pin '@rails/actioncable', to: '@rails--actioncable.js', preload: true
pin 'handlebars', to: 'handlebars.js', preload: true
pin 'fs', preload: true
pin 'source-map', preload: true
