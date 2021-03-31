{% extends 'layouts/base.php' %}

{% block title %}Playlist{% endblock %}

{% block css %}
<style>
  #nav li:nth-child(1) {border-bottom: 10px solid #e28b78;}
</style>
{% endblock %}
{% block js %}
<script src="js/home.js" type="text/javascript"></script>
<meta http-equiv="refresh" content="30" />
{% endblock %}

{% block content %}
{% for song in playlist %}
<div class="track-area">
  <div class="track">
    <img src="{{ song.img_url }}" height="250" width="250" />
    <span class="trackinfo">{{ song.name }} by {{ song.artist }}
      {% if user.level == 9%}<div class="button-area"><span class="myButton mark-played" data-index="{{ song.id }}">Mark as Played</span></div>{% endif %}
    </span>
  </div>
  <div class="requestedby">Requested By: {{ song.username }}</div>
</div>
{% endfor %}
{% endblock %}
