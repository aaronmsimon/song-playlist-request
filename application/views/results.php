{% extends 'layouts/base.php' %}

{% block title %}Search{% endblock %}

{% block css %}
<style>
  #nav li:nth-child(2) {border-bottom: 10px solid #e28b78;}
</style>
{% endblock %}
{% block js %}<script src="js/home.js" type="text/javascript"></script>{% endblock %}

{% block content %}
<form id="searchform" action="../search/results" method="post">
  <input id="search-string" name="search-string" type="text" value="enter a song name" class="greyfont" />
  <input class="hidden" name="offset" />
  <input type="submit" value="Search" class="myButton" id="search-button"/>
</form>

<div id="search-href" class="hidden">{{ results.tracks.href }}</div>

{% for track in results.tracks.items %}
<div class="track">
  <img src="{{ track.album.images[1].url }}" height="250" width="250" />
  <span class="trackinfo">
    {{ track.name }} by {{ track.artists[0].name }}
    {% if track.preview_url != null %}<a href="{{ track.preview_url }}" target="_blank" class="preview">Listen</a>{% endif %}
    <div class="button-area"><span class="myButton request-song" data-index="{{ loop.index0 }}">Request this Song</span></div>
  </span>
</div>
{% endfor %}
{% if results.tracks.items | length > 0 %}
<div class="float-container">
  <form action="../search/prev" method="post" class="search-nav" id="search-nav-prev">
    <input name="prevurl" value="{{ results.tracks.previous }}" class="hidden" />
    <input type="submit" value="Prev" id="prev" class="myButton" />
  </form>
  <form action="../search/next" method="post" class="search-nav" id="search-nav-next">
    <input name="nexturl" value="{{ results.tracks.next }}" class="hidden" />
    <input type="submit" value="Next" id="next" class="myButton" />
  </form>
</div>
{% endif %}

{% endblock %}
