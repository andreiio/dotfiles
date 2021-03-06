// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
    defaultBrowser: 'Safari',
    options: {
        // Hide the finicky icon from the top bar. Default: false
        hideIcon: true,
        // Check for update on startup. Default: true
        checkForUpdate: false,
        // Log every request with basic information to console. Default: false
        logRequests: false,
    },
    rewrite: [
        //
    ],
    handlers: [
        {
            match: /^https?:\/\/.*\.test$/,
            browser: 'Google Chrome'
        },
        {
            match: /^https?:\/\/meet\.google\.com\/.*$/,
            browser: 'Google Chrome'
        },
        {
            match: [
                'zoom.us/*',
                finicky.matchDomains(/.*\zoom.us/),
                /zoom.us\/j\//,
            ],
            browser: 'us.zoom.xos',
        },
        {
            match: 'https://www.figma.com/file/*',
            browser: 'Figma',
        }
    ]
}
