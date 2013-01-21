configurations = {
  'browser': {
    'webpageCallback': () ->
      webpage = browser.getWebpage()
      Screensaver.shoot(webpage).save('temp/googl.png')
      phantom.exit()
  },
}

browser = Browser.start(configurations['browser'])
browser.open('http://www.google.com')
