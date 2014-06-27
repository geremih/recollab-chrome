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
        <input type="text" id="tags" name="tags"> </input>
      </form>
    </div>'

comment_dialog_html  = '    <div id="comment-dialog-form">
      <form>
        <label for="comment">Comments </label>
        <input type="text" id="comment" name="comment"> </input>
      </form>
    </div> '

$("body").append(tag_dialog_html)
$("body").append(comment_dialog_html)

addTag = () ->
        data = {
                link: document.URL,
                tags: $("#tags").val()
                }
        console.log data
        $.ajax(
                type: "POST",
                url: "http://localhost:3000/pages/",
                dataType: "JSON",
                crossDomain: true,
                xhrFields: 
                        withCredentials: true,
                data: data).done ( msg ) ->
                        alert( "Data Saved: " )
                        console.log msg

        alert "Add tag"
        tagDialog.dialog("close")
tagDialog = $( "#tag-dialog-form" ).dialog
              autoOpen: false,
              height: 150,
              width: 350,
              modal: true,
              buttons: 
                "Add Tag": addTag,
                Cancel: () ->
                        alert "Cancel"
                        tagDialog.dialog( "close" )


addComment = () ->
        data = {
                link: document.URL,
                comment: $("#comment").val()
                }
        console.log data
        $.ajax(
                type: "POST",
                url: "http://localhost:3000/pages/",
                dataType: "JSON",
                crossDomain: true,
                xhrFields: 
                        withCredentials: true,
                data: data).done ( msg ) ->
                        alert( "Data Saved: " )
                        console.log msg

        alert "Add comment"
        commentDialog.dialog("close")

commentDialog = $( "#comment-dialog-form" ).dialog
              autoOpen: false,
              height: 300,
              width: 350,
              modal: true,
              buttons: 
                "Add comment": addComment,
                Cancel: () ->
                        alert "Cancel"
                        commentDialog.dialog( "close" )

 
showTagDialog = () ->
        tagDialog.dialog("open")
        
showCommentDialog = () ->
        commentDialog.dialog("open")
Mousetrap.bind('alt+t', showTagDialog )
Mousetrap.bind('alt+c', showCommentDialog)



console.log "Its working!!"
        

