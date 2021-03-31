<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
		<title>{{ site_name }}</title>
		<base href="{{ base_url }}www/" />
		<link rel="icon" type="image/png" href="images/favicon.ico" />
		<link href="css/public.css" rel="stylesheet" />
		{% block css %}{% endblock %}
		{% block js %}{% endblock %}
	</head>
	<body>
		<div id="wrapper">
			<div id="header"></div>
      <div id="welcome">Liz & Owen 2020</div>
      <div id="content">
			{% block content %}
			{% endblock %}
      </div>
		</div>
	</body>
</html>
