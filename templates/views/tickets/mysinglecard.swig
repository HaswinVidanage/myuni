<table class="table  table-striped">
	<tr>
		<td>
			<a href='{{card.url}}'><b>{{card.institute.name|capitalize}}</b><a>
                </br>{{card.university.name|capitalize}}                
                <i>{{card.title.name|capitalize}}</i>
                
                 {% if card.university.logo.filename %}
                    <img src='uploads/uni/logos/{{card.university.logo.filename}}' alt="{{card.university.name}}" height="42" width="42" class="rightimg"> 
                    <img src='uploads/inst/logos/{{card.institute.logo.filename}}' alt="{{card.institute.name}}" height="42" width="42" class="rightimg"> 
                 {% else %}
                    <img src='images/default_uni_logo.png' alt="{{Card.title}}" height="42" width="42" class="rightimg">
                 {% endif %}                 
                 
                 <ul class="Card-meta">
	               <li>&nbsp;</li>
                    <li>
                        <small>Status</small><a href="" rel="tag">{{Card.status}}</a>
			</li>
            
                <li>{{card.university.alias|capitalize}}</li>
                <li>{{card.university.location|capitalize}}</li>

                <li>{{card.institute.name|capitalize}}</li>
                <li>{{card.institute.alias|capitalize}}</li>
                <li>{{card.institute.location|capitalize}}</li>
                
                <li>{{card.institute.name|capitalize}}</li>
                <li>{{card.institute.rating|capitalize}}</li>

                <li>{{card.title.name|capitalize}}</li>

                <p>{{card.description|capitalize}}</p>
                <li>{{card.entry_req|capitalize}}</li>
                <li>LKR {{card.fee|capitalize}}</li>
                <li>Last Updated on {{card.updatedAt}}</li>
                <li>Card Rating {{card.rating}}</li>
                <li>Duration :{{card.duration}}</li>
                <li>Category :{{card.category}}</li>
            
			<li>
				<small>Rating ★</small><a href="" rel="tag">{{Card.rating}}</a>
			</li>
			<li class="rating">
				<!-- This has to be optimized : consider using anything other than swig-->
				{% if Card.rating == 5%}
				<span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span
				class="ratingGold">★</span> {% elseif Card.rating == 4%}
				<span class="">☆</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span
				class="ratingGold">★</span> {% elseif Card.rating == 3%}
				<span class="">☆</span><span class="">☆</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span
				class="ratingGold">★</span> {% elseif Card.rating == 2%}
				<span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="ratingGold">★</span><span class="ratingGold">★</span>				{% elseif Card.rating == 1%}
				<span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="ratingGold">★</span>				{% elseif Card.rating
				<=0 %} <span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="">☆</span> {% endif %}
			</li>
			<ul class="Card-meta">
				<li>&nbsp;</li>
				<li>
					<small>Priority</small><a href="" rel="tag">{{Card.priority}}</a>
				</li>
				<li>
					<small>Category</small><a href="" rel="tag">{{Card.category}}</a>
				</li>
				<li>
					<small>Last Updated</small>
					<abbr class="last-updated">{{Card._.createdAt.format('Do MMMM YYYY')}}</abbr>
				</li>
				<li>
					<a href='{{Card.url}}' class="btn btn-info" role="button" onclick="alert(" Hellp ")">More Details</a>
				</li>
			</ul>
		</td>
	</tr>
</table>
