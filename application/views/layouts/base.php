<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
		<title>{% block title %}{% endblock %} | {{ site_name }}</title>
		<base href="{{ base_url }}www/" />
		<link rel="icon" type="image/png" href="images/favicon.ico" />
		<link href="css/base.css" rel="stylesheet" />
		<link href="css/button.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://d1nkt0x8bzz6gz.cloudfront.net/api/css?family=MrsEavesRoman:Regular"/>
		<link rel="stylesheet" href="https://d1nkt0x8bzz6gz.cloudfront.net/api/css?family=Didot%20LT%20Std:Roman"/>
		<link rel="stylesheet" href="https://d1nkt0x8bzz6gz.cloudfront.net/api/css?family=MrsEavesItalic:Regular"/>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Crimson+Pro" />
		<link href="css/jqueryui/custom-{{ jqueryui_theme }}/jquery-ui.min.css" rel="stylesheet" />
		<script src="js/jquery-{{ jquery_vers }}.min.js" type="text/javascript"></script>
		<script src="js/jquery-ui.min.js" type="text/javascript"></script>
		{% block js %}{% endblock %}
		{% block css %}{% endblock %}
	</head>
	<body>
		<div id="allwrapper">
			<div id="center">
				{% if user.name != '' %}<div id="user">{{ user.name }} <a href="{{ base_url }}user/logout" class="loginout">[LOGOUT]</a></div>{% endif %}
				<div id="title">
					<p>Liz and Owen's Wedding Playlist</p>
				</div>
				<ul id="nav">
					<li><a href="..">PLAYLIST</a></li>
					<li><a href="../search">REQUEST A SONG</a></li>
				</ul>
				<div id="content">
				{% block content %}{% endblock %}
				</div>
			</div>
		</div>
	</body>
</html>
