{% extends "../../layouts/default.swig" %}
{% block content %}



	<div class="container">
			<div class="dropdown">

				<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown"> Filter
				<span class="caret"></span></button>
					    <ul class="dropdown-menu">
					    	{% for ticket in data.tickets %}
						      <li><a href='{{ticket.url}}'>{{ticket.title}}</a></li>
						    {% endfor %}
					    </ul>
			</div>
		
			</br>
	        {% for ticket in data.tickets %}
	            <div class="container col-md-4">
	             {% include 'mysingleticket.swig' %}
	            </div>
	        {% endfor %}
        
	</div>
{% endblock %}


