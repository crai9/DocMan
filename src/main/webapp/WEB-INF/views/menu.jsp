<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div>
                  	  <a href="#menu"><img class="move-logo-right navbar-brand" src="<c:url value='/resources/img/DocMan.png' />" /></a>
                	</div>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                
                <c:choose>
      				<c:when test="${authenticated == false || empty authenticated}">
					<ul class="nav navbar-nav navbar-right">
                        <li><a href="<c:url value='/loginPage' />">Login</a>
                        </li>
                        <li><a href="">Sign Up</a>
                        </li>
                    </ul>
     			 	</c:when>

      				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><img src="resources/img/notification.png" height="20px"><span class="color badge">4</span></a>
						<ul class="dropdown-menu" role="menu" style="padding:10px;">
                    			<li><b>Edmond </b> sent you a document</li>
                    			<li class="divider"></li>
                    			<li><b>Craig </b> sent you a document</li>
                  			</ul>
						</li>
                        <li><a href="<c:url value='/dashboard' />">Dashboard</a></li>
                        <li class="dropdown active">
                  			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><c:if test="${admin == true}">
							<span class="badge">Admin</span>
						</c:if> ${username}<span class="caret"></span></a>
                  			<ul class="dropdown-menu" role="menu">
                    			<li><a href="<c:url value='/account' />">Account</a></li>
                    			<li class="divider"></li>
                    			<li><a href="<c:url value='/logout' />">Log out</a></li>
                  			</ul>
                		</li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <input name="search" type="text" class="form-control" placeholder="Search...">
                    </form>
      				</c:otherwise>
				</c:choose>

                </div>
            </div>
        </nav>

    </div>
</div>
