exit = () ->
    phantom.exit()

evaluate = () ->
    console.log 'welcom'


class Screenshoter
    constructor: () ->
        @page = require('webpage').create()

    configure: (options) =>
        @evaluate = options['evaluate']
        @callback = options['callback']

    take: (siteUrl, imagePath) =>
        @page.open siteUrl, (status) =>
            @page.evaluate @evaluate
            @page.render(imagePath)
            @callback()


screenshoter = new Screenshoter()
system = require('system')
screenshoter.configure({'callback': exit, 'evaluate': evaluate})
screenshoter.take(system.args[1], system.args[2])
