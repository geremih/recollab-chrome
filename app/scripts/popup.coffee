'use strict';

console.log('\'Allo \'Allo! Popup')
server = 'http://recollab.herokuapp.com'
chrome.tabs.getSelected null ,
        (tab) ->
                tablink = tab.url
                link_encoded =  encodeURIComponent("link")
                parameter_encoded =  encodeURIComponent(tablink)
                fram=document.createElement('iframe')
                fram.setAttribute('width', '100%')
                fram.setAttribute('height', '100%')
                fram.setAttribute('frameborder', '0')
                fram.setAttribute('id', 'rtmframe')
                fram.setAttribute('src',  server + '/pages/result?' + link_encoded  + "=" + parameter_encoded)
                fram.setAttribute('id', "popup-body")
                document.body.appendChild(fram)
                

