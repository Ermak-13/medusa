class Screensaver
    constructor: (webpage, configurations = {}) ->
        # private methods

        # constructor
        @webpage = webpage

    @shoot: (webpage) ->
        return new Screensaver(webpage)

    save: (imagePath) =>
        @webpage.render(imagePath)
