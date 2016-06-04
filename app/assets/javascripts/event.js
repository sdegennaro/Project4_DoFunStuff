$(function(){
  console.log("event loaded!");
  setStartButtonHandler();
  setCreateButtonHandler();
})

var showEventId
var eventIdArray = [];

$.get('/api/events', function(response){
  for (var i = 0; i < response.events.length; i++) {
    eventIdArray.push(response.events[i].id);
  };
}).then(function(){
  showEventId = eventIdArray[Math.floor(Math.random()*eventIdArray.length)]
})

setStartButtonHandler = function(){
  $("#start-button").on("click",function(){
    $("#event-id-"+showEventId).show();
    $(this).hide();
    $("#create-button").hide();

  })
setCreateButtonHandler = function(){
  $("#create-button").on("click",function(){
    $("#create-event-form").show()
    $(this).hide();
    $("#start-button").hide()
  })
}

}
