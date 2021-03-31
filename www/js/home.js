$(document).ready(function() {
  $("#search-string").click(function() {
    if ($(this).val() == "enter a song name") {
      $(this).val("");
      $(this).removeClass("greyfont");
      $(this).addClass("blackfont");
    }
  }).focusout(function() {
    if ($(this).val() == "") {
      $(this).removeClass("blackfont");
      $(this).addClass("greyfont");
      $(this).val("enter a song name")
    }
  });

  $(".request-song").click(function() {
    $.post("../search/insert_song", {
      search_href: $("#search-href").text(),
      song_index: $(this).attr("data-index")
    }, function(data) {
     window.location = "../search/song-added";
    });
  });

  $(".mark-played").click(function() {
    $.post("../search/mark_played", {
      songid: $(this).attr("data-index")
    }, function(data) {
      location.reload();
    });
  });
});
