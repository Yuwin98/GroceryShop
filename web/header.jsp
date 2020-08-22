<div class="header-container">
    <header>
        <div class="search-bar">
            <form class="input-form" action="search" method="POST">
                <input type="hidden" name="type", value="<%=request.getAttribute("type") == null ? "":request.getAttribute("type")%>">
                <input class="item_input" type="text" name="itemName" placeholder="What are you looking for?">
                <input class="search_btn" type="submit" value="Search">
            </form>
        </div>
        <div class="actions">
            <a href="#" class="cart-link">
                <% int len = (int) request.getAttribute("cartLength");
                    if(len > 0){
                %>
                <div class="cart-count-container"><span class="cart-count"><%=len%></span></div>
                <% } %>
                <div class="header-icon hi1">
                    <svg id="Capa_1" enable-background="new 0 0 512 512" height="32" viewBox="0 0 512 512" width="32"
                         xmlns="http://www.w3.org/2000/svg">
                        <g>
                            <g>
                                <path d="m157.004 277.769c-9.706 0-17.602 7.896-17.602 17.602v101.017c0 9.706 7.896 17.602 17.602 17.602h20.204c9.706 0 17.602-7.896 17.602-17.602v-101.018c0-9.705-7.896-17.602-17.602-17.602h-20.204zm22.805 17.601v101.017c0 1.435-1.167 2.602-2.602 2.602h-20.204c-1.435 0-2.602-1.167-2.602-2.602v-101.017c0-1.435 1.167-2.602 2.602-2.602h20.204c1.435.001 2.602 1.168 2.602 2.602z"/>
                                <path d="m245.898 277.769c-9.706 0-17.602 7.896-17.602 17.602v101.017c0 9.706 7.896 17.602 17.602 17.602h20.203c9.706 0 17.602-7.896 17.602-17.602v-101.018c0-9.705-7.896-17.602-17.602-17.602h-20.203zm22.805 17.601v101.017c0 1.435-1.167 2.602-2.602 2.602h-20.203c-1.435 0-2.602-1.167-2.602-2.602v-101.017c0-1.435 1.167-2.602 2.602-2.602h20.203c1.435.001 2.602 1.168 2.602 2.602z"/>
                                <path d="m354.996 277.769h-20.204c-9.706 0-17.602 7.896-17.602 17.602v101.017c0 9.706 7.896 17.602 17.602 17.602h20.204c9.706 0 17.602-7.896 17.602-17.602v-101.018c0-9.705-7.896-17.601-17.602-17.601zm2.602 118.618c0 1.435-1.167 2.602-2.602 2.602h-20.204c-1.435 0-2.602-1.167-2.602-2.602v-101.017c0-1.435 1.167-2.602 2.602-2.602h20.204c1.435 0 2.602 1.167 2.602 2.602z"/>
                                <path d="m494.4 194.937h-50.61c-4.142 0-7.5 3.357-7.5 7.5s3.358 7.5 7.5 7.5h50.61c1.434 0 2.6 1.166 2.6 2.6v20.2c0 1.438-1.167 2.609-2.6 2.609h-123.014c.599-1.166 1.122-2.38 1.559-3.64 2.423-6.992 1.979-14.509-1.252-21.166l-.293-.604h37.29c4.142 0 7.5-3.357 7.5-7.5s-3.358-7.5-7.5-7.5h-44.569l-62.989-129.807c-6.67-13.742-23.278-19.496-37.018-12.829-3.096 1.502-5.827 3.528-8.114 5.964-2.287-2.435-5.018-4.462-8.114-5.964-13.743-6.668-30.349-.913-37.018 12.829l-62.989 129.808h-130.279c-9.705 0-17.6 7.896-17.6 17.6v20.2c0 9.71 7.896 17.609 17.6 17.609h10.331l30.533 180.63c3.082 18.253 18.759 31.501 37.276 31.501h256.05c4.142 0 7.5-3.357 7.5-7.5s-3.358-7.5-7.5-7.5h-256.05c-11.17 0-20.626-7.99-22.485-19l-30.111-178.131h22.736c4.142 0 7.5-3.357 7.5-7.5s-3.358-7.5-7.5-7.5h-48.28c-1.434 0-2.6-1.171-2.6-2.609v-20.2c0-1.434 1.167-2.6 2.6-2.6h123l-.293.604c-3.23 6.657-3.675 14.174-1.252 21.166.437 1.26.96 2.474 1.559 3.64h-39.634c-4.142 0-7.5 3.357-7.5 7.5s3.358 7.5 7.5 7.5h368.844l-30.984 178.236c-1.901 10.947-11.351 18.894-22.47 18.894h-29.48c-4.142 0-7.5 3.357-7.5 7.5s3.358 7.5 7.5 7.5h29.48c18.431 0 34.097-13.175 37.249-31.326l31.43-180.805h9.351c9.705 0 17.6-7.899 17.6-17.609v-20.2c0-9.705-7.896-17.6-17.6-17.6zm-230.195-121.872c1.111-3.206 3.404-5.788 6.457-7.269 1.782-.865 3.667-1.274 5.526-1.274 4.716 0 9.255 2.637 11.449 7.156l70.561 145.411c1.481 3.053 1.685 6.499.574 9.705s-3.405 5.788-6.457 7.269c-3.053 1.483-6.5 1.686-9.706.574-3.206-1.11-5.787-3.404-7.269-6.457l-70.561-145.41c-1.481-3.053-1.685-6.499-.574-9.705zm-8.205 25.972 46.536 95.9h-93.072zm-31.637-27.359c2.194-4.521 6.732-7.156 11.449-7.156 1.858 0 3.745.41 5.526 1.274 3.052 1.48 5.346 4.062 6.457 7.269 1.111 3.206.907 6.652-.574 9.705l-70.561 145.41c-1.481 3.053-4.062 5.347-7.269 6.457-3.206 1.111-6.653.909-9.706-.574-3.052-1.48-5.346-4.062-6.457-7.269-1.111-3.206-.907-6.652.574-9.705zm-34.208 163.051 12.03-24.792h107.63l12.03 24.792c.101.209.212.411.318.617h-132.326c.106-.206.216-.408.318-.617z"/>
                            </g>
                        </g>
                    </svg>
                </div>
            </a>
            <a href="#">
                <div class="header-login"><h3>Login</h3></div>
            </a>
            <a href="#">
                <div class="header-icon hi2">
                    <svg height="48" width="48" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                         viewBox="0 0 478.407 478.407" style="enable-background:new 0 0 478.407 478.407;"
                         xml:space="preserve">
<g>
    <g>
        <path d="M239.608,0C107.649-0.223,0.494,106.57,0.271,238.529c-0.11,65.237,26.459,127.682,73.54,172.84
			c0.137,0.136,0.188,0.341,0.324,0.461c1.382,1.331,2.884,2.458,4.284,3.738c3.84,3.413,7.68,6.946,11.725,10.24
			c2.167,1.707,4.42,3.413,6.639,4.983c3.823,2.85,7.646,5.7,11.639,8.329c2.714,1.707,5.513,3.413,8.294,5.12
			c3.686,2.219,7.356,4.454,11.162,6.485c3.226,1.707,6.519,3.174,9.796,4.727c3.584,1.707,7.117,3.413,10.786,4.949
			c3.669,1.536,7.356,2.731,11.076,4.062s6.929,2.56,10.496,3.652c4.028,1.212,8.158,2.15,12.254,3.157
			c3.413,0.836,6.724,1.792,10.24,2.475c4.71,0.939,9.489,1.536,14.268,2.185c2.953,0.41,5.837,0.99,8.823,1.28
			c7.817,0.768,15.701,1.195,23.654,1.195s15.838-0.427,23.654-1.195c2.987-0.29,5.871-0.87,8.823-1.28
			c4.779-0.649,9.557-1.246,14.268-2.185c3.413-0.683,6.827-1.707,10.24-2.475c4.096-1.007,8.226-1.946,12.254-3.157
			c3.567-1.092,7.014-2.423,10.496-3.652c3.482-1.229,7.441-2.56,11.076-4.062s7.202-3.26,10.786-4.949
			c3.277-1.553,6.571-3.021,9.796-4.727c3.806-2.031,7.475-4.267,11.162-6.485c2.782-1.707,5.581-3.26,8.294-5.12
			c3.994-2.628,7.817-5.478,11.639-8.329c2.219-1.707,4.471-3.243,6.639-4.983c4.045-3.243,7.885-6.69,11.725-10.24
			c1.399-1.28,2.901-2.406,4.284-3.738c0.136-0.119,0.188-0.324,0.324-0.461c46.912-44.929,73.428-107.076,73.404-172.032
			C478.36,107.378,371.567,0.223,239.608,0z M406.013,357.729c-10.952-51.083-44.59-94.39-91.375-117.641
			c38.245-41.661,35.475-106.438-6.186-144.683C266.79,57.16,202.014,59.93,163.769,101.591c-35.954,39.166-35.954,99.332,0,138.497
			c-46.785,23.251-80.423,66.557-91.375,117.641c-65.565-91.946-44.179-219.635,47.768-285.2
			c34.744-24.775,76.369-38.06,119.042-37.992c112.929-0.18,204.621,91.221,204.801,204.15
			C444.073,281.36,430.788,322.985,406.013,357.729z"/>
    </g>
</g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
</svg>
                </div>
            </a>
        </div>
    </header>
</div>
