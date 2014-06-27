'use strict';

console.log('\'Allo \'Allo! Popup')
chrome.tabs.getSelected null ,
        (tab) ->
                tablink = tab.url
                alert(tablink)
