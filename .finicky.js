// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

let defaultBrowser = {
    name: 'com.google.Chrome',
    profile: 'Default',
    openInBackground: false,
}

let workBrowser = {
    name: 'com.google.Chrome',
    profile: 'Profile 4',
    openInBackground: false,
}

module.exports = {
    defaultBrowser,
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
            browser: workBrowser,
        },
        {
            match: /^https?:\/\/(docs|drive|meet)\.google\.com\/.*$/,
            browser: workBrowser,
        },
        {
            match: ({ url }) => url.host.endsWith("amazonaws.com"),
            browser: workBrowser,
        },
        {
            match: [
                'zoom.us/*',
                finicky.matchDomains(/.*\zoom.us/),
            ],
            browser: 'us.zoom.xos',
        },
        {
            match: 'https://www.figma.com/file/*',
            browser: 'com.figma.Desktop',
        }
    ]
}
