   
        <table class="table  table-striped">
            <tr>
               <td>              
                
                 <a href='{{ticket.url}}'><b>{{ticket.title |capitalize}}</b><a>
                 {% if ticket.image.filename %}
                    <img src='uploads/images/{{ticket.image.filename}}' alt="{{ticket.title}}" height="42" width="42" class="rightimg"> 
                 {% else %}
                    <img src='images/default_uni_logo.png' alt="{{ticket.title}}" height="42" width="42" class="rightimg">
                 {% endif %}                 
                 
                 <ul class="ticket-meta">
	               <li>&nbsp;</li>
                    <li>
                        <small>Status</small><a href="" rel="tag">{{ticket.status}}</a>
                    </li>
                    <li>
                        <small>Rating ★</small><a href="" rel="tag">{{ticket.rating}}</a>
                    </li>
                    <li class="rating">
                        <!-- This has to be optimized : consider using anything other than swig--> 
                        {% if ticket.rating == 5%}
                             <span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span>
                        {% elseif ticket.rating == 4%}
                            <span class="">☆</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span>
                        {% elseif ticket.rating == 3%}
                            <span class="">☆</span><span class="">☆</span><span class="ratingGold">★</span><span class="ratingGold">★</span><span class="ratingGold">★</span>
                        {% elseif ticket.rating == 2%}
                            <span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="ratingGold">★</span><span class="ratingGold">★</span>
                        {% elseif ticket.rating == 1%}
                            <span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="ratingGold">★</span>
                        {% elseif ticket.rating <= 0%}
                            <span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="">☆</span><span class="">☆</span>
                        
                        {% endif %}    
                  </li>

                    
                  <ul class="ticket-meta">
                  <li>&nbsp;</li>
                  <li>
                        <small>Priority</small><a href="" rel="tag">{{ticket.priority}}</a>
                    </li>
                    <li>
                        <small>Category</small><a href="" rel="tag">{{ticket.category}}</a>
                    </li>
                    <li>
                        <small>Last Updated</small>
                        <abbr class="last-updated">{{ticket._.createdAt.format('Do MMMM YYYY')}}</abbr>
                    </li>
                    <li>
                        <a href='{{ticket.url}}' class="btn btn-info" role="button" onclick="alert("Hellp")">More Details</a>
                    </li>
                  </ul>


               </td>
               </tr>
        </table>


