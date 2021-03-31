{% extends 'layouts/base.php' %}

{% block title %}Song Added to Playlist{% endblock %}

{% block css %}
<style type="text/css">
#result {
  width: 60%;
  margin: 0 auto;
  text-align: center;
}
img {max-width: 100%;}
#message {
  font-size: 3em;
  color: #b56857;
  padding-bottom: 20px;
}
</style>
{% endblock %}
{% block js %}
<script>
   setTimeout(function(){
      window.location.href = '../';
   }, 5000);
</script>
{% endblock %}

{% block content %}
<div id="result">
  <div id="message">{{ message }}</div>
  <img src="images/img{{ pic }}.jpg" />
</div>
{% endblock %}
