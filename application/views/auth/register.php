{% extends 'layouts/public.php' %}

{% block css %}
<link href="css/register.css" rel="stylesheet" />
{% endblock %}
{% block js %}
<script src="js/jquery-{{ jquery_vers }}.min.js" type="text/javascript"></script>
{% endblock %}

{% block content %}
<div class="reg" id="regform">
{{ form_open|raw }}
	<label for="username" class="form_label">Username</label>
	<input type="text" name="username" id="username" class="reg_input" autocomplete="off" maxlength="12" />
	<label for="email" class="form_label">Email</label>
	<input type="text" name="email" id="email" class="reg_input" autocomplete="off" maxlength="255" />
	<label for="pass" class="form_label">Password</label>
	<input type="password" name="pass" id="pass" class="reg_input password"  autocomplete="off" />
	<label for="verifypass" class="form_label">Verify Password</label>
	<input type="password" name="verifypass" id="verifypass" class="reg_input password"  autocomplete="off" />
	<input type="submit" name="register_button" value="REGISTER" id="register_button"  />
</form>
</div>
<div class="reg">
  <div id="owen-squat"></div>
</div>

<script type="text/javascript">
$(document).ready(function() {
  $("#header").hide();
  $(".reg_input").css("width","375px");
});
</script>
{% endblock %}
