<%@ page import="util.Roles" %>
<%@ page import="Model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Admin | User-Edit</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/style.css">

    <script>function openChoose() {
        const fileInput = document.getElementById("file-upload");
        fileInput.click();
    }

    function PreviewImage() {
        let uploadImage = document.getElementById("upload-image");
        const container = document.getElementById("user-field-container-img");
        var oFReader = new FileReader();

        oFReader.readAsDataURL(document.getElementById("file-upload").files[0]);
        oFReader.onload = function (oFREvent) {
            uploadImage.src = oFREvent.target.result;
            uploadImage.classList.remove("user-edit-image-placeholder");
            uploadImage.classList.add("user-edit-image");
            container.classList.remove("placeholder");
        };
    };

    function handleClick(param) {
            console.log(param.value);
        }

        function showInput(id) {
            const field = document.getElementById("user-field-text-container-"+id);
            const edit = document.getElementById("user-field-text-edit-"+id);
            field.classList.remove("show-item");
            field.classList.add("hide-item");
            edit.classList.remove("hide-item");
            edit.classList.add("show-item");
        }


    </script>

</head>
<body>

<jsp:include page="admin-nav.jsp"/>

<%
    User user = (User) request.getAttribute("user");
    boolean saveForm = true;
    if(user == null){
        user = new User();
    }else {
        saveForm = false;
    }

    String path =  user.getPath().equals("") ? "": request.getContextPath() + "/images/users/" + user.getPath();
    String imgClass  = user.getPath().equals("N/A") ? "placeholder":"";
    String firstName = "";
    String lastName = "";
    if(!user.getName().equals("")){
        String[] name = user.getName().split(" ");
        firstName = name[0] != null ? name[0]:"";
        lastName = name.length > 1 && !name[1].equals("") ? name[1]:"";
    }
    String firstNameClass = firstName.isEmpty() ? "hide-item":"show-item";
    String firstNameEditClass = firstName.isEmpty() ? "show-item":"hide-item";

    String lastNameClass = lastName.isEmpty() ? "hide-item":"show-item";
    String lastNameEditClass = lastName.isEmpty() ? "show-item":"hide-item";

    String contactNumber = user.getContactNumber();
    String contactNumberClass = contactNumber.isEmpty() ? "hide-item":"show-item";
    String contactNumberEditClass = contactNumber.isEmpty() ? "show-item":"hide-item";

    String email = user.getEmail();
    String emailClass = email.isEmpty() ? "hide-item":"show-item";
    String emailEditClass = email.isEmpty() ? "show-item":"hide-item";

    String password = user.getPassword();
    String userName = user.getUsername();


    int isOnline = user.isOnline();
    String onlineString = isOnline == 1 ? "Online":"Offline";
    String onlineClass = isOnline == 1 ? "Online":"";
    int isActive = user.getActive();
    String activeAttribute = isActive == 1 ? "checked":"checked";
    String role = user.getRole();
    boolean isAdmin = role.equals("Administrator");

    String usernameError = request.getAttribute("username-error") != null ? (String) request.getAttribute("username-error") : "";

%>


<div class="user-container">

        <% if(saveForm) { %>
                    <form action="add-user" method="post" enctype="multipart/form-data">
                <% } else { %>
                    <form action="update-user" method="post" enctype="multipart/form-data">
                        <input type="text" value="<%=user.getId()%>" name="id" hidden>
                <% } %>
        <table class="table-edit-users">
            <thead>
            <tr>
                <th class="table-edit-user-heading" colspan="3">EDIT USER</th>
            </tr>
            </thead>
            <tbody>
                <tr class="edit-row">
                    <td class="edit-title">Avatar</td>
                    <td class="edit-field">
                        <div class="user-img-container <%=imgClass%>" id="user-field-container-img">
                            <a onclick="openChoose()" href="javascript:void(0);" class="user-field-text-link">
                                <% if(imgClass.equals("placeholder")) { %>
                                    <img src="${pageContext.request.contextPath}/static/icons/camera.svg" id="upload-image" class="user-edit-image-placeholder">
                                <% } else { %>
                                    <img src="${pageContext.request.contextPath}/images/users/<%=user.getPath()%>"  class="user-edit-image">
                                <% } %>
                            </a>
                            <input type="file" onchange="PreviewImage()" id="file-upload" name="upload-image" size="50" hidden>
                        </div>


                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">First Name</td>
                    <td class="edit-field">

                        <div class="user-field-text-container <%=firstNameClass%>" id="user-field-text-container-fn">
                            <h3 class="user-field-text"><%=firstName%></h3>
                            <a onclick="showInput('fn')" href="javascript:void(0);" class="user-field-text-link">
                                <svg width="10px"  height="10px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 383.947 383.947" style="enable-background:new 0 0 383.947 383.947;" xml:space="preserve">
<g>
    <g>
        <g>
            <polygon points="0,303.947 0,383.947 80,383.947 316.053,147.893 236.053,67.893 			"/>
            <path d="M377.707,56.053L327.893,6.24c-8.32-8.32-21.867-8.32-30.187,0l-39.04,39.04l80,80l39.04-39.04
				C386.027,77.92,386.027,64.373,377.707,56.053z"/>
        </g>
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
                            </a>
                        </div>

                            <div class="<%=firstNameEditClass%> user-field-text-edit" id="user-field-text-edit-fn">
                                <input class="user-field-text-input"  type="text" name="firstname" placeholder="Enter First Name" maxlength="255" spellcheck="false" value="<%=firstName%>" required>
                            </div>

                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Last Name</td>
                    <td class="edit-field">
                        <div id="user-field-text-container-ln" class="user-field-text-container <%=lastNameClass%>">
                            <h3 class="user-field-text"><%=lastName%></h3>
                            <a onclick="showInput('ln')" href="javascript:void(0);" class="user-field-text-link">
                                <svg width="10px"  height="10px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 383.947 383.947" style="enable-background:new 0 0 383.947 383.947;" xml:space="preserve">
<g>
    <g>
        <g>
            <polygon points="0,303.947 0,383.947 80,383.947 316.053,147.893 236.053,67.893 			"/>
            <path d="M377.707,56.053L327.893,6.24c-8.32-8.32-21.867-8.32-30.187,0l-39.04,39.04l80,80l39.04-39.04
				C386.027,77.92,386.027,64.373,377.707,56.053z"/>
        </g>
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
                            </a>
                        </div>
                            <div class="user-field-text-edit <%=lastNameEditClass%>" id="user-field-text-edit-ln">
                                <input value="<%=lastName%>" class="user-field-text-input" type="text" name="lastname" placeholder="Enter Last Name" maxlength="255" spellcheck="false">
                            </div>
                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">User Name</td>
                    <td class="edit-field">
                        <% if(!userName.equals("") && usernameError.equals("")) { %>
                        <div class="user-field-text-container">
                            <h3 class="user-field-text"><%=userName%></h3>
                        </div>
                        <% }else { %>
                        <div class="user-field-text-edit">
                            <input class="user-field-text-input" type="text" name="username" placeholder="Enter Last Name" maxlength="255" spellcheck="false" required>
                        </div>
                        <% } %>
                    </td>
                    <td class="edit-warning"><%=usernameError%></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Email</td>
                    <td class="edit-field">

                            <div class="user-field-text-container <%=emailClass%>"   id="user-field-text-container-em">
                            <h3 class="user-field-text"><%=email%></h3>
                            <a onclick="showInput('em')" href="javascript:void(0);" class="user-field-text-link">
                                <svg width="10px"  height="10px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 383.947 383.947" style="enable-background:new 0 0 383.947 383.947;" xml:space="preserve">
<g>
    <g>
        <g>
            <polygon points="0,303.947 0,383.947 80,383.947 316.053,147.893 236.053,67.893 			"/>
            <path d="M377.707,56.053L327.893,6.24c-8.32-8.32-21.867-8.32-30.187,0l-39.04,39.04l80,80l39.04-39.04
				C386.027,77.92,386.027,64.373,377.707,56.053z"/>
        </g>
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
                            </a>
                        </div>

                            <div class="user-field-text-edit <%=emailEditClass%>" id="user-field-text-edit-em">
                                <input type="email" value="<%=email%>" class="user-field-text-input"  name="email" placeholder="Enter Email Address" maxlength="255" spellcheck="false" required>
                            </div>

                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Password</td>
                    <td class="edit-field">
                        <% if(!password.equals("")) { %>
                        <div class="user-field-text-container">
                            <h3 class="user-field-text"><%=password%></h3>
                        </div>
                        <% }else { %>
                        <div class="user-field-text-edit">
                            <input class="user-field-text-input" type="password" name="password" placeholder="Enter Password" maxlength="255" spellcheck="false" required>
                        </div>
                        <% } %>
                    </td>
                    <td class="edit-warning"><%=usernameError%></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Contact Number</td>
                    <td class="edit-field">

                            <div class="user-field-text-container <%=contactNumberClass%>" id="user-field-text-container-cn">
                            <h3 class="user-field-text"><%=contactNumber%></h3>
                            <a onclick="showInput('cn')" href="javascript:void(0);" class="user-field-text-link">
                                <svg width="10px"  height="10px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 383.947 383.947" style="enable-background:new 0 0 383.947 383.947;" xml:space="preserve">
<g>
    <g>
        <g>
            <polygon points="0,303.947 0,383.947 80,383.947 316.053,147.893 236.053,67.893 			"/>
            <path d="M377.707,56.053L327.893,6.24c-8.32-8.32-21.867-8.32-30.187,0l-39.04,39.04l80,80l39.04-39.04
				C386.027,77.92,386.027,64.373,377.707,56.053z"/>
        </g>
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
                            </a>
                        </div>

                            <div class="user-field-text-edit <%=contactNumberEditClass%>" id="user-field-text-edit-cn">
                                <input value="<%=contactNumber%>" class="user-field-text-input" type="number" name="contactnumber" placeholder="Enter Contact Number" maxlength="255" spellcheck="false" required>
                            </div>

                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Status</td>
                    <td class="edit-field">
                        <div class=" user-field-text-container">
                            <div class="edit-online <%=onlineClass.toLowerCase()%>">
                                <svg width="8px" height="8px"  version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
<g>
    <g>
        <path d="M256,0C115.39,0,0,115.39,0,256s115.39,256,256,256s256-115.39,256-256S396.61,0,256,0z"/>
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
                                <span><%=onlineString%></span>
                            </div>
                        </div>
                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Active</td>
                    <td class="edit-field">
                        <div class="user-field-text-edit active-switch">
                            <label class="switch">
                                <input type="checkbox"  name="active"  <%=activeAttribute%>>
                                <span class="slider round"></span>
                            </label>

                        </div>
                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-row">
                    <td class="edit-title">Role</td>
                    <td class="edit-field">
                        <div class="user-field-text-container">
                            <select class="role-select" name="role">
                                <option value="Select"  hidden>Select</option>
                                <option value="<%=Roles.User%>" <%=!isAdmin ? "selected":""%> ><%=Roles.User%></option>
                                <option value="<%=Roles.Administrator%>" <%=isAdmin ? "selected":""%> > <%=Roles.Administrator%></option>
                            </select>
                        </div>
                    </td>
                    <td class="edit-warning"></td>
                </tr>
                <tr class="edit-submit">
                    <td><div class="edit-save"><input type="submit" value="Save"></div></td>
                    <td><div class="edit-delete"><a href="delete-user?userid=<%=user.getId()%>" >Delete</a></div></td>
                </tr>

            </tbody>
        </table>
    </form>


</div>

</body>

</html>
