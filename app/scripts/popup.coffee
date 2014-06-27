'use strict';

console.log('\'Allo \'Allo! Popup')
chrome.tabs.getSelected null ,
        (tab) ->
                tablink = tab.url
                console.log "Url is"
                console.log encodeURIComponent("link")
                console.log encodeURIComponent(tablink)
                url = 'http://localhost:3000/pages/result?' + encodeURIComponent("link")  + "=" + encodeURIComponent(tablink)
                console.log url
                fram=document.createElement('iframe')
                fram.setAttribute('width', '100%')
                fram.setAttribute('height', '100%')
                fram.setAttribute('frameborder', '0')
                fram.setAttribute('id', 'rtmframe')
                fram.setAttribute('src', url)
                document.body.appendChild(fram)
