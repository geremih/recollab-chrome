'use strict';

chrome.runtime.onInstalled.addListener (details) ->
    console.log('previousVersion', details.previousVersion)

chrome.browserAction.setBadgeText({text: '\'Allo'})
chrome.tabs.query {'active': true, 'lastFocusedWindow': true},  (tabs) -> 
        url = tabs[0].url
        console.log url
        


console.log('\'Allo \'Allo! Event Page for Browser Action')
