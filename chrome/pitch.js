chrome.extension.onRequest.addListener( function(request, sender, sendResponse) {
    if (request.action == "getEmails") {
        sendResponse( {"emails": emails} );
    }
});

chrome.extension.onRequest.addListener( function(request, sender, sendResponse) {
    if (request.action == "log") {
        console.log( Array.prototype.slice.call(request.data) );
    }
});

var emails = [];

$(function() {
    emails = _.uniq($("body").html().match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi)); 
    chrome.extension.sendRequest({action: "emails", data: emails});
});
