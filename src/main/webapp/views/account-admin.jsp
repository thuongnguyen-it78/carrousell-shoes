<%@ page import="java.util.ArrayList" %>
<%@ page import="thuongnguyen.it78.models.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/img/site/favicon.ico">
    <link rel="stylesheet" href="/resources/css/style-404.css" type="text/css">



    <title>Quản Lý Tài Khoản</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        #btn-alert-account {
            position: fixed;
            top: 9px;
            right: 24px;
        }
    </style>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/view">
            <div class="sidebar-brand-icon rotate-n-15">
            </div>
            <div class="sidebar-brand-text mx-3">Carroushoes</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/admin/view">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Tổng Quan</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">


        <!-- Heading -->
        <div class="sidebar-heading">
            Quản lý
        </div>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/admin/account">
                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                <span>Tài Khoản</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/admin/product">
                <i class="fas fa-calendar fa-fw mr-2 text-gray-400"></i>
                <span>Sản phẩm</span></a>
        </li>


        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/admin/order">
                <i class="fas fa-fw fa-clipboard-list mr-2 text-gray-400"></i>

                <span>Đơn hàng</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/admin/banner">
                <i class="fas fa-fw fa-table  mr-2 text-gray-400"></i>
                <span>Banner</span></a>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="/admin/category">
                <i class="fas fa-caret-square-down  mr-2 text-gray-400"></i>
                <span>Category</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Tìm kiếm..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <!-- Dropdown - Alerts -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">
                                Alerts Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for your account.
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">
                                Message Center
                            </h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="/resources/admin/img/undraw_profile_1.svg"
                                         alt="">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                        problem I've been having.</div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="/resources/admin/img/undraw_profile_2.svg"
                                         alt="">
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">I have the photos that you ordered last month, how
                                        would you like them sent to you?</div>
                                    <div class="small text-gray-500">Jae Chun · 1d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="/resources/admin/img/undraw_profile_3.svg"
                                         alt="">
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Last month's report looks great, I am very happy with
                                        the progress so far, keep up the good work!</div>
                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                         alt="">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                        told me that people say this to all dogs, even if they aren't good...</div>
                                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                </div>
                            </a>
                            <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>
                    <%
                        Account account1 = (Account) request.getSession().getAttribute("account");

                    %>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=account1.getFullName()%></span>
                            <img class="img-profile rounded-circle"
                                 src="/resources/img/avatar/<%=account1.getAvatar()%>">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/me/info">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Tài khoản của tôi
                            </a>
                            <a class="dropdown-item" href="/me/password">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đổi mật khẩu
                            </a>
                            <a class="dropdown-item" href="/admin/view">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Trang quản lý
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/me/logout" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Đăng xuất
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="display: flex; justify-content: space-between;">
                            <b>Quản lý tài khoản</b>
                            <a href="#" class="btn btn-success btn-sm btn-icon-split">
                                <!-- Add  -->
                                <span class="text" style="margin-right: auto" data-toggle="modal" data-target="#add-account">Thêm tài khoản</span>
                            </a>

                        </h6>
                    </div>



                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th class = "id">ID</th>
                                    <th class = "avatar">Avatar</th>
                                    <th class = "name">Tên</th>
                                    <th class = "email">Email</th>
                                    <th class = "phone">Số điện thoại</th>
                                    <th class = "active">Active</th>
                                    <th class = "role">Role</th>
                                    <th class = "action">Action</th>

                                </tr>
                                </thead>

                                <tbody>
                                <%
                                    ArrayList<Account> listAccount = (ArrayList<Account>) request.getAttribute("list-account");
                                    for(Account account : listAccount) {
                                %>
                                <tr>
                                    <td class = "id"><%=account.getId()%></td>
                                    <td class = "avatar"><img src="/resources/img/avatar/<%=account.getAvatar()%>" alt="Avatar"></td>
                                    <td class = "fullname"><%=account.getFullName()%></td>
                                    <td class = "email"><%=account.getEmail()%></td>
                                    <td class = "phone"><%=account.getNumber()%></td>
                                    <td class = "active"><%=account.getActive()%></td>
                                    <td class = "role"><%=account.getRole()%></td>


                                    <td>
                                        <input class = "gender" type="text" value = "<%=account.getGender()%>" hidden>
                                        <input class = "address" type="text" value = "<%=account.getAddress()%>" hidden>

                                        <button class="btn btn-warning btn-circle btn-sm" data-toggle="modal" data-target = "#edit-account" data-id ="1">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </button>

                                        <button class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target = "#delete-account">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>

                                <%
                                    }
                                %>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

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
                <h5 class="modal-title" id="exampleModalLabel11">Bạn chắc chắn đăng xuất?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Nhấn đăng xuất để hoàn thành</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                <a class="btn btn-primary" href="/me/logout">Đăng xuất</a>
            </div>
        </div>
    </div>
</div>

<!-- Add Account Modal  -->
<div class="modal fade" id="add-account" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
    <div class="modal-dialog modal-size">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm tài khoản</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="user" action = "/admin/account?type=add" method="POST">

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="fullname-form">Họ và tên</label>
                            <input type="text" class="form-control form-control-user" id="fullname-form" name = "fullname">
                        </div>
                        <div class="col-sm-6">
                            <label for="phone-form">Số điện thoại</label>
                            <input type="text" class="form-control form-control-user" id="phone-form" name = "phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email-form">Email</label>
                        <input type="email" class="form-control form-control-user" id="email-form" name = "email">
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="password-form">Mật khẩu</label>
                            <input type="password" class="form-control form-control-user" id="password-form" name = "password">
                        </div>
                        <div class="col-sm-6">
                            <label for="repassword-form">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control form-control-user" id="repassword-form" name = "repassword">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="gender-form">Giới tính</label>
                        <select class="form-control" id="gender-form" name = "gender">
                            <option value="1">Nam</option>
                            <option value="0">Nữ</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="address-form">Địa chỉ</label>

                        <input type="address" class="form-control form-control-user" id="address-form" name = "address">
                    </div>



                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id = "btn-add-account">Thêm</button>
            </div>
        </div>
    </div>
</div>

<%--Edit Account Modal --%>
<div class="modal fade" id="edit-account" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-size">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel1">Cập nhật tài khoản</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="user" action = "/admin/account?type=update" method="POST" enctype="multipart/form-data">
                    <input type="text" name = "id" hidden>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="fullname-form1">Họ và tên</label>
                            <input type="text" class="form-control form-control-user" id="fullname-form1" name = "fullname">
                        </div>
                        <div class="col-sm-6">
                            <label for="phone-form1">Số điện thoại</label>
                            <input type="text" class="form-control form-control-user" id="phone-form1" name = "phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email-form1">Email</label>
                        <input type="email" class="form-control form-control-user" id="email-form1" name = "email">
                    </div>
                    <!-- <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="password-form1">Mật khẩu</label>
                            <input type="password" class="form-control form-control-user" id="password-form1" name = "password">
                        </div>
                        <div class="col-sm-6">
                            <label for="repassword-form1">Nhập lại mật khẩu</label>
                            <input type="repassword-form" class="form-control form-control-user" id="repassword-form1" name = "repassword">
                        </div>
                    </div> -->


                    <div class="form-group">
                        <label for="gender-form1">Giới tính</label>
                        <select class="form-control" id="gender-form1" name = "gender">
                            <option value = "1">Nam</option>
                            <option value = "0">Nữ</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="file-form1">Avatar</label>
                        <input type="file" class="form-control-file" id="file-form1" name = "avatar">
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <label for="active-form1">Active</label>
                            <input type="number" class="form-control form-control-user" id="active-form1" name = "active">
                        </div>
                        <div class="col-sm-6">
                            <label for="role-form1">Role</label>
                            <input type="number" class="form-control form-control-user" id="role-form1" name = "role">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address-form1">Địa chỉ</label>

                        <input type="address" class="form-control form-control-user" id="address-form1" name = "address">
                    </div>



                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id = "btn-edit-account">Cập nhật</button>
            </div>
        </div>
    </div>
</div>

<!-- Delete Account Modal -->
<div class="modal fade" id="delete-account" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa...</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <span>Bạn có chắc chắn xóa <b></b></span>

                <form action="/admin/account?type=delete" method="POST" hidden>
                    <input type="text" name = "id">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" id ="btn-delete-account">Xóa</button>
            </div>
        </div>
    </div>
</div>
<%
    String flag = (String) request.getAttribute("flag");
    if(flag != null) {
        if(flag.equals("error")) {

%>
        <div class="alert alert-danger" role="alert" id ="btn-alert-account">
            Thực hiện thất bai!
        </div>

<%
    } if(flag.equals("success")) {
%>
        <div class="alert alert-success" role="alert" id ="btn-alert-account">
            Thực hiện thành công!
        </div>
<%
    } }
%>


<!-- Bootstrap core JavaScript-->
<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
<script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/admin/js/demo/datatables-demo.js"></script>

<%--Account admin scripts --%>
<script src="/resources/admin/js/demo/account-admin.js"></script>
<script>
    let btnAlertAccount = document.getElementById("btn-alert-account")
    if(btnAlertAccount) {
        setTimeout(() => {
            btnAlertAccount.remove()
        }, 2000)
    }
</script>


</body>

</html>