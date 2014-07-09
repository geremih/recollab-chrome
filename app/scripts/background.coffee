'use strict';

tags = {}
gotTags = false

getTags = ->
        console.log "Getting tags"
        $.get "http://localhost:3000/tags.json",
                (data) ->
                        console.log "Got tags" +  data
                        tags = data
                        gotTags = true
getTags()
                        
chrome.runtime.onMessage.addListener  (request, sender, sendResponse) -> 
                console.log("Got request")
                if (request.greeting == "tags")
                        sendResponse({tags: tags})
                        if(!gotTags)
                                getTags()

chrome.runtime.onInstalled.addListener (details) ->
    console.log('previousVersion', details.previousVersion)

chrome.browserAction.setBadgeText({text: '\'Allo'})
chrome.tabs.query {'active': true, 'lastFocusedWindow': true},  (tabs) -> 
        url = tabs[0].url
        console.log url
        


console.log('\'Allo \'Allo! Event Page for Browser Action')
