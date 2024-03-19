<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - UsersCRUD</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value ="/theme/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">


</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/user/list">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/user/list">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->


            <!-- Heading -->


            <!-- Nav Item - Pages Collapse Menu -->


            <!-- Nav Item - Utilities Collapse Menu -->


            <!-- Divider -->


            <!-- Heading -->


            <!-- Nav Item - Pages Collapse Menu -->


            <!-- Nav Item - Charts -->


            <!-- Nav Item - Tables -->


            <!-- Divider -->


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="/header.jsp" %>

                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
                        <a href="/user/list" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                            <i class="fas fa-sm text-white-50"></i>Lista użytkowników</a>
                    </div>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
                        </div>
                        <div class="card-body">
                            <c:if test="${not empty email}">
                                <span style="color:red">Istnieje już użytkownik o adresie mailowym <b>${email}</b>. Podaj inny adres mailowy.</span>
                            </c:if>

                                            <form method="post" id="myForm" class="user">
                                                Nazwa<br>
                                                <input type="text" name="username"
                                                <c:if test="${not empty email}">
                                                     value="${username}"
                                                </c:if>

                                                       required><br>
                                                Email<br>
                                                <input type="text" name="email" id="email" required>
                                                <span id="emailError" style="color: red;"></span> <!-- Komunikat o błędzie -->
                                                <br>
                                                Hasło<br>
                                                <input type="password" name="password" id="password1" required>
                                                <span style=" cursor: pointer; color: dodgerblue; text-decoration: underline" onclick="togglePasswordVisibility()">Pokaż hasła</span> <!-- to dodałem -->
                                                <br>
                                                Powtórz hasło<br>
                                                <input type="password" name="password2" id="password2" required>
                                                <span id="passwordError" style="color: red;"></span><br> <!-- Komunikat o błędzie -->
                                                <br><br>
                                                <input type="button" value="Zapisz" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="checkPasswordsAndEmail()">
                                            </form>



                                            <script>
                                                function togglePasswordVisibility() {
                                                    var inputField1 = document.getElementById("password1");
                                                    var inputField2 = document.getElementById("password2");
                                                    if (inputField1.type === "password") {
                                                        inputField1.type = "text";
                                                        inputField2.type = "text";
                                                    } else {
                                                        inputField1.type = "password";
                                                        inputField2.type = "password";
                                                    }
                                                }

                                                function isValidEmail(email) {
                                                    // Wyrażenie regularne do sprawdzania poprawności adresu e-mail
                                                    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                                    return emailRegex.test(email);
                                                }
                                                function checkEmail() {
                                                    var emailInput = document.getElementById("email");
                                                    var emailError = document.getElementById("emailError");

                                                    if (isValidEmail(emailInput.value)) {
                                                        emailError.textContent = "";// Wyczyść komunikat o błędzie, jeśli e-mail jest poprawny
                                                        return true;
                                                    } else {
                                                        emailError.textContent = "Nieprawidłowy adres e-mail"; // Wyświetl komunikat o błędzie, jeśli e-mail jest nieprawidłowy
                                                    return false;
                                                    }
                                                }

                                                function checkPassword() {
                                                    var password1 = document.getElementById("password1").value;
                                                    var password2 = document.getElementById("password2").value;
                                                    if (password1 === password2) {
                                                        passwordError.textContent = "";// Wyczyść komunikat o błędzie, jeśli hasło są takie same
                                                        return true;
                                                    }
                                                    else {
                                                        passwordError.textContent = "Wpisane hasła są różne";
                                                        return false;
                                                    }
                                                }
                                                // Dodaj zdarzenie blur do pola e-mailowego
                                                var emailInput = document.getElementById("email");
                                                emailInput.addEventListener("blur", checkEmail);

                                                var passwordInput1 = document.getElementById("password1");
                                                passwordInput1.addEventListener("blur", checkPassword);

                                                var passwordInput2 = document.getElementById("password2");
                                                passwordInput2.addEventListener("blur", checkPassword);

                                                function submitForm() {
                                                    // Dodaj kod do przetwarzania formularza
                                                    // Sprawdź, czy e-mail jest poprawny przed wysłaniem formularza
                                                    if (isValidEmail(emailInput.value)) {
                                                        // E-mail jest poprawny - możesz wysłać formularz
                                                        document.getElementById("myForm").submit();
                                                    } else {
                                                        // E-mail jest nieprawidłowy - nie można wysłać formularza
                                                        alert("Popraw błędy w formularzu przed wysłaniem.");
                                                    }
                                                }


                                                function checkPasswordsAndEmail() {
                                                    var password1 = document.getElementById("password1").value;
                                                    var password2 = document.getElementById("password2").value;
                                                    if (password1.trim() === "" || password2.trim() === "") {
                                                        alert("Proszę wprowadzić hasło.");
                                                        return;
                                                    }
                                                    if (checkPassword() && checkEmail()) {
                                                        document.getElementById("myForm").submit();
                                                    }
                                                }
                                            </script>







                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">


                        <!-- Earnings (Monthly) Card Example -->

                        <!-- Earnings (Monthly) Card Example -->

                        <!-- Earnings (Monthly) Card Example -->


                        <!-- Pending Requests Card Example -->

                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->


                        <!-- Pie Chart -->

                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->


                        <div class="col-lg-6 mb-4">

                            <!-- Illustrations -->


                            <!-- Approach -->


                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="/footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <%@ include file="/javascript.jsp" %>

</body>

</html>