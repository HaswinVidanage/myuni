{% extends "../../layouts/default.swig" %}

{% block content %}

	<div class="container">
    {#
        This is a comment.
    #}
		<div class="panel panel-primary">
        <!-- Default panel contents -->
        <div class="panel-heading">Card details - {{data.card.title.name}}
        </div>
        <div class="panel-body">
            <span class="label label-info pull-right">{{data.card.status}}</span>
            <p>{{data.card.description}}</p>
        </div>
        <ul class="ticket-meta">
        <li>
            <small>Status</small><a href="" rel="tag">{{data.card.status}}</a>
        </li>
        <li>
            <small>Priority</small><a href="" rel="tag">{{data.card.priority}}</a>
        </li>
        <li>
            <small>Category</small><a href="" rel="tag">{{data.card.category}}</a>
        </li>
        <li>
            <small>Last Updated</small>
            <abbr class="last-updated">{{data.card._.createdAt.format('Do MMMM YYYY')}}</abbr>
        </li>
        </ul>
        
        <div class="panel-footer"></div>
         <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="500" data-numposts="5"></div> 
        </div>
         
	</div>
{% endblock %}