<!-- UNI SEARCH !!!! -->

{% extends "../../layouts/default.swig" %}

{%- block js -%}
    <!-- typehead js -->
    <script src="/js/bootstrap/typeahead.jquery.min.js"></script>
    <script src="/js/bootstrap/bloodhound.min.js"></script>
    <script src="/js/bootstrap/typeahead.bundle.min.js"></script>


    <script type="text/javascript">
    var substringMatcher = function(strs) {
          return function findMatches(q, cb) {
            var matches, substringRegex;

            // an array that will be populated with substring matches
            matches = [];

            // regex used to determine if a string contains the substring `q`
            substrRegex = new RegExp(q, 'i');

            // iterate through the pool of strings and for any string that
            // contains the substring `q`, add it to the `matches` array
            $.each(strs, function(i, str) {
              if (substrRegex.test(str)) {
                matches.push(str);
              }
            });

            cb(matches);
          };
        };

        var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
          'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
          'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
          'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
          'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
          'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
          'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
          'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
          'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
        ];

        $('#the-basics .typeahead').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        },
        {
          name: 'states',
          source: substringMatcher(states)
        });


    </script>

{%- endblock -%}


{% block content %}
    <div class="container">
        <div class="jumbotron">
            <h2>{% if user %} Hello {{ user.name.first }} {{ user.name.last }}! {% endif %} Welcome to IncTicket</h2>
                <hr>
            {% if user  %}
                <p>
                    <a href="/createticket" class="btn btn-lg btn-primary">Create a Ticket</a>
                </p>
            {% else %}
                <p>
                    <a href="/join" style="margin-right: 10px" class="btn btn-lg btn-primary">Create An Account</a>
                    to use the IncTicket system.
                </p>
            {% endif %}
            <hr>
            <p>
                To view a <a href="/tickets" target="_blank">List of Tickets</a> Click here.
            </p>
        </div>

        <div id="the-basics">
          <input class="typeahead" type="text" placeholder="States of USA">
        </div>
    </div>
{% endblock %}
