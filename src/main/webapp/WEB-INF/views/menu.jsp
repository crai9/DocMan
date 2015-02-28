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
                    <a class="navbar-brand" href="http://localhost:8080/DocMan">Document Manager</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                
                <c:choose>
      				<c:when test="${authenticated == false}">
					<ul class="nav navbar-nav navbar-right">
                        <li><a href="loginPage">Login</a>
                        </li>
                        <li><a href="">Sign Up</a>
                        </li>
                    </ul>
     			 	</c:when>

      				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
                        <li><a href="dashboard">Your Docs</a>
                        </li>
                        <li><a href="settings">Settings</a>
                        </li>
                        <li class="dropdown">
                  			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${username} <span class="caret"></span></a>
                  			<ul class="dropdown-menu" role="menu">
                    			<li><a href="profile">Profile</a></li>
                    			<li class="divider"></li>
                    			<li><a href="logout">Log out</a></li>
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
