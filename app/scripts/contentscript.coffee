'use strict';

console.log '\'Allo \'Allo! Content script'
 # $( document ).tooltip
 #        items: "a, [href], [data-href]",
 #        content: ->
 #                        element = $( this );
 #                        console.log("Hovering on element")
 #                        console.log element
 #                        console.log "Href"
 #                        console.log element.attr("href")
                        
 #                        text = element.attr("href");
 #                        return text;
 #                        if ( element.is( "[data-href]" ) )
 #                                alert "Its a google href"

'<div id="dialog" title="Basic dialog">
  <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the "x" icon.</p>
</div>'

tag_dialog_html = '    <div id="tag-dialog-form">
      <form>
        <label for="tags">Tags </label>
        <input type="text" id="recollab-tags" name="tags"> </input>
      </form>
    </div>'

comment_dialog_html  = '    <div id="comment-dialog-form">
      <form>
        <label for="comment">Comment </label>
        <input type="text" id="recollab-comment" name="comment"> </input>
      </form>
    </div> '
$("body").append(tag_dialog_html)
$("body").append(comment_dialog_html)

server = "http://recollab.herokuapp.com"

addTag = () ->
        data = {
                link: document.URL,
                tags: $("#recollab-tags").val(),
                title: $(document).find("title").text()
                }
        console.log data
        $.ajax(
                type: "POST",
                url: server + "/pages/",
                dataType: "JSON",
                crossDomain: true,
                xhrFields: 
                        withCredentials: true,
                data: data).done ( msg ) ->
                        console.log msg


        tagDialog.dialog("close")
tagDialog = $( "#tag-dialog-form" ).dialog
              autoOpen: false,
              height: 150,
              width: 350,
              modal: true,
              buttons: 
                "Add Tag": addTag,
                Cancel: () ->
                        tagDialog.dialog( "close" )


addComment = () ->
        data = {
                link: document.URL,
                comment: $("#recollab-comment").val(),
                title: $(document).find("title").text()
                }
        console.log data
        $.ajax(
                type: "POST",
                url: server + "/pages/",
                dataType: "JSON",
                crossDomain: true,
                xhrFields: 
                        withCredentials: true,
                data: data).done ( msg ) ->
                        console.log msg


        commentDialog.dialog("close")

commentDialog = $( "#comment-dialog-form" ).dialog
              autoOpen: false,
              height: 300,
              width: 350,
              modal: true,
              buttons: 
                "Add comment": addComment,
                Cancel: () ->

                        commentDialog.dialog( "close" )

 
showTagDialog = () ->
        tagDialog.dialog("open")
        
showCommentDialog = () ->
        commentDialog.dialog("open")
Mousetrap.bind('alt+t', showTagDialog )
Mousetrap.bind('alt+c', showCommentDialog)



console.log "Its working!!"
availableTags = ["EMPTY"] 
chrome.runtime.sendMessage  {greeting: "tags"},
        (response) ->
                availableTags = response.tags
                console.log(response.tags)




split = (val) ->
        val.split( /,\s*/ )

extractLast = ( term ) ->
        split( term ).pop()



$( "#recollab-tags").bind( "keydown", ( event ) ->

                if ( event.keyCode == $.ui.keyCode.TAB &&  $( this ).autocomplete( "instance" ).menu.active ) 
                        event.preventDefault())
$("#recollab-tags").autocomplete
        minLength: 0,
        source: ( request, response ) ->
                
                response( $.ui.autocomplete.filter(availableTags, extractLast( request.term ) ) );
        focus: ->
                false
        select: ( event, ui ) ->
                        terms = split( this.value )
                        terms.pop()
                        terms.push( ui.item.value )
                        terms.push( "" )
                        this.value = terms.join( ", " )
                        false

