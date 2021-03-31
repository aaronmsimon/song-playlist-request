{% extends 'layouts/public.php' %}

{% block content %}
{{ form_open|raw }}
	<div class="formrow">
		<label for="login_string" class="form_label">Username or Email</label>
		<input type="text" name="login_string" id="login_string" class="form_input" autocomplete="off" maxlength="255" />
	</div>
	<div class="formrow">
		<label for="login_pass" class="form_label">Password</label>
		<input type="password" name="login_pass" id="login_pass" class="form_input password"  autocomplete="off" />
	</div>
	<div class="formrow">
		<input type="checkbox" id="remember_me" name="remember_me" value="yes" />
		<label for="remember_me" class="form_label">Remember Me</label>
	</div>
	<div class="formrow">
		<a href="{{ base_url }}user/recover">Can't access your account?</a>
	</div>
	<div class="formrow">
		<a href="{{ base_url }}user/register">Register</a>
	</div>
	<div class="formrow"><input type="submit" name="submit" value="LOGIN" id="submit_button"  /></div>
</form>
{% endblock %}
