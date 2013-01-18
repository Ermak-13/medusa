configurations = {
  'browser': {
    'webpageCallback': () ->
      browser.getWebpage().render('temp/google.png')
      phantom.exit()
  },
}

browser = Browser.start(configurations['browser'])
browser.open('http://www.google.com')
