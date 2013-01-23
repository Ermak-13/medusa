window.medusa ||= {}

class Browser
  constructor: (configurations = {}) ->
    # private methods
    initSettings = () =>
      default_settings = {
        'windowSize': {
          'width': 800,
          'height': 600
        }
      }
      @settings = default_settings

      for name, value of configurations
        @settings[name] = value

    validSettings = () =>
      unless @settings['webpageCallback']?
        throw InvalidSettings.build('webpage callback is empty.')

    initWebpage = () =>
      @webpage = require('webpage').create()

    configure = () =>
      @webpage.onLoadFinished = @settings.webpageCallback

      if @settings['settings']?
        @webpage.settings = settings

      if @settings['cookies']?
        for cookie in @settings.cookies
          @addCookie(cookie)

      if @settings['headers']?
        @webpage.customHeaders = @settings.headers

      if @settings['windowSize']?
        @webpage.viewportSize = @settings.windowSize

    # constructor
    initSettings()
    validSettings()

    initWebpage()
    configure()

  @start: (configurations) ->
    return new Browser(configurations)

  @run: (configurations) ->
    return new Browser(configurations)

  open: (url) =>
    @webpage.open url

  getWebpage: () =>
    return @webpage

  addCookie: (configurations) =>
    @webpage.addCookie(configurations)

  evaluate: (script) =>
    @webpage.evaluate(script)

window.medusa.Browser = Browser
