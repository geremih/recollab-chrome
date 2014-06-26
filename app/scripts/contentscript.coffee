'use strict';

console.log '\'Allo \'Allo! Content script'
$( document ).tooltip
        items: "a, [href], [data-href]",
        content: ->
                        element = $( this );
                        console.log("Hovering on element")
                        console.log element
                        console.log "Href"
                        console.log element.attr("href")
                        
                        text = element.attr("href");
                        return text;
                        if ( element.is( "[data-href]" ) )
                                alert "Its a google href"

alert "Its working!!"
         

