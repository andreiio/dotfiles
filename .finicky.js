// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
    defaultBrowser: "Safari",
    options: {
        checkForUpdate: false
    },
    rewrite: [
        //
    ],
    handlers: [
        {
            match: /^https?:\/\/.*\.test$/,
            browser: "Google Chrome"
        },
        {
            match: /^https?:\/\/meet\.google\.com\/.*$/,
            browser: "Google Chrome"
        },
        {
            match: [
                "zoom.us/*",
                finicky.matchDomains(/.*\zoom.us/),
                /zoom.us\/j\//,
            ],
            browser: "us.zoom.xos",
        },
        {
            match: "https://www.figma.com/file/*",
            browser: "Figma",
        }
    ]
}
