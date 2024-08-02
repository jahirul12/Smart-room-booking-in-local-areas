<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><img src="../data/img/logo.jpeg" width="120px" height="40px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i class="fas fa-home"></i>
							HOME</a></li>
				
			</ul>

			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<%-- <c:if test="${not empty userObj }"> --%>

					<li class="nav-item dropdown"><a
						class="nav-link active dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"><i
							class="fas fa-user-circle"></i> ${adminObj.fullName } </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

							<li><a class="dropdown-item" href="../ulogout">logout</a></li>

						</ul></li>
				<%-- </c:if> --%>


			</ul>
		</div>
	</div>
</nav>