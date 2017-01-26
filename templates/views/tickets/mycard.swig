{% extends "../../layouts/default.swig" %}

{%- block js -%}
    <!-- typehead js -->
    <script src="/js/bootstrap/typeahead.jquery.min.js"></script>
    <script src="/js/bootstrap/bloodhound.min.js"></script>
    <script src="/js/bootstrap/typeahead.bundle.min.js"></script>


    <script type="text/javascript">
    	var ticketList=[];
	    $(document).ready(function() {
	    //var url =  "http://localhost:3000/api/tickets";
	    var url =  "/api/tickets";
	    $.getJSON(url + "?callback=?", null, function(obj) {
	    	console.log(obj.tickets[0].title);
	    	console.log(obj.tickets.length);

	        for (i = 0; i < obj.tickets.length; i++) {
	        	ticketList[i] = obj.tickets[i].title; 
			}
			console.log(ticketList);
	    });
	});

	// $('#search_input').bind('typeahead:selected', function(obj, datum, name) {      
	//         alert(JSON.stringify(obj)); // object
	//         // outputs, e.g., {"type":"typeahead:selected","timeStamp":1371822938628,"jQuery19105037956037711017":true,"isTrigger":true,"namespace":"","namespace_re":null,"target":{"jQuery19105037956037711017":46},"delegateTarget":{"jQuery19105037956037711017":46},"currentTarget":
	//         alert(JSON.stringify(datum)); // contains datum value, tokens and custom fields
	//         // outputs, e.g., {"redirect_url":"http://localhost/test/topic/test_topic","image_url":"http://localhost/test/upload/images/t_FWnYhhqd.jpg","description":"A test description","value":"A test value","tokens":["A","test","value"]}
	//         // in this case I created custom fields called 'redirect_url', 'image_url', 'description'   

	//         alert(JSON.stringify(name)); // contains dataset name
	//         // outputs, e.g., "my_dataset"

	// });

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

        $('#the-basics .typeahead').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
        },
        {
          name: 'states',
          source: substringMatcher(ticketList)
        }).bind('typeahead:selected', function(obj, datum, name) {      
		        alert(JSON.stringify(obj)); // object
		        // outputs, e.g., {"type":"typeahead:selected","timeStamp":1371822938628,"jQuery19105037956037711017":true,"isTrigger":true,"namespace":"","namespace_re":null,"target":{"jQuery19105037956037711017":46},"delegateTarget":{"jQuery19105037956037711017":46},"currentTarget":
		        alert(JSON.stringify(datum)); // contains datum value, tokens and custom fields
		        // outputs, e.g., {"redirect_url":"http://localhost/test/topic/test_topic","image_url":"http://localhost/test/upload/images/t_FWnYhhqd.jpg","description":"A test description","value":"A test value","tokens":["A","test","value"]}
		        // in this case I created custom fields called 'redirect_url', 'image_url', 'description'   

		        alert(JSON.stringify(name)); // contains dataset name
		        // outputs, e.g., "my_dataset"

		        window.location.href='/search?keywords='+datum;

		});;

       

    </script>

{%- endblock -%}

{%- block css %}
    <style type="text/css">
    .bs-example {
        font-family: sans-serif;
        position: relative;
        margin: 100px;
    }
    .typeahead, .tt-query, .tt-hint {
        border: 2px solid #CCCCCC;
        /*border-radius: 8px;*/
        font-size: 22px; /* Set input font size */
        height: 38px;
        line-height: 30px;
        outline: medium none;
        padding: 8px 12px;
        width: 396px;
    }
    .typeahead {
    	width:525px;
        background-color: #FFFFFF;
    }
    .typeahead:focus {
        border: 2px solid #0097CF;
    }
    .tt-query {
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    }
    .tt-hint {
        color: #999999;
    }
    .tt-menu {
        background-color: #FFFFFF;
        border: 1px solid rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        margin-top: 12px;
        padding: 8px 0;
        width:525px;
    }
    .tt-suggestion {
        font-size: 22px;  /* Set suggestion dropdown font size */
        padding: 3px 20px;
    }
    .tt-suggestion:hover {
        cursor: pointer;
        background-color: #0097CF;
        color: #FFFFFF;
    }
    .tt-suggestion p {
        margin: 0;
    }
	.stylish-input-group .input-group-addon{
	    background: white !important; 
	}
	.stylish-input-group .form-control{
		border-right:0; 
		box-shadow:0 0 0; 
		border-color:#ccc;
	}
	.stylish-input-group button{
	    border:0;
	    background:transparent;
	}

	.search-btn{
	    padding-left: 18px;
	    padding-right: 18px;
	    padding-top: 7px;
	    padding-bottom: 7px;

	}

	.input-group-addon{
		padding-right: 0px;
	    padding-left: 0px;
	    padding-top: 0px;
	    padding-bottom: 0px;
	}
    </style>
{% endblock -%}

{% block content %}



	<div class="container">
			<div class="dropdown">

				<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown"> Filter
				<span class="caret"></span></button>
					    <ul class="dropdown-menu">
					    	{% for card in data.cards %}
						      <li><a href='{{card.url}}'>{{card.title}}</a></li>
						    {% endfor %}
					    </ul>
			</div>
		
			</br>

			<!-- <div >
			<form id="form-country_v1" name="form-country_v1"  action="/search" method="GET">
	          <input class="typeahead" type="text" placeholder="States of USA">
	          <button type="submit" class="btn btn-secondary btn-sm"></button>
	        </form>
	        </div> -->

	        <div class="container">
				<div class="row">
			        <div class="col-sm-6 col-sm-offset-3">
			            <div id="imaginary_container"> 
			            	<div id="the-basics">
				                <div class="input-group stylish-input-group">
				                    <input type="text" id="search_input" class="typeahead" placeholder="Search" >
				                    <span class="input-group-addon">
				                        <button type="submit" class="search-btn">
				                            <span class="glyphicon glyphicon-search"></span>
				                        </button>  
				                    </span>
				                </div>
			               	</div>
			            </div>
			        </div>
				</div>
			</div>

	        
			</br>
	        {% for card in data.cards %}
	            <div class="container col-md-4">
	             <b>{{ card.university.name }}</b>
	             <b>{{card.university.logo.filename}}</b>
	             {% include 'mysinglecard.swig' %}
	            </div>
	        {% endfor %}
        
	</div>
{% endblock %}


