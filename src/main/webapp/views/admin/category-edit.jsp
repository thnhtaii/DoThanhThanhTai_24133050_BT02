<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Danh Mục - Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .sidebar {
            width: 250px;
            background-color: #0090d9;
            color: white;
            display: flex;
            flex-direction: column;
            flex-shrink: 0;
        }
        .sidebar-header {
            padding: 15px 20px;
            font-size: 24px;
            font-weight: bold;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .profile-section {
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid white;
            object-fit: cover;
            margin: 0 auto 10px auto;
            display: block;
        }
        .profile-role {
            font-size: 14px;
            font-weight: 500;
        }
        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar-menu li a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            transition: background 0.2s;
        }
        .sidebar-menu li a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        .menu-dashboard a {
            background-color: #d9534f;
        }
        .menu-category {
            background-color: #222;
        }
        .submenu {
            list-style: none;
            padding: 0;
            margin: 0;
            background-color: #2b2b2b;
        }
        .submenu li a {
            padding: 10px 20px 10px 40px;
            font-size: 13px;
            color: #aaa;
        }
        .submenu li a:hover {
            color: white;
            background-color: #333;
        }
        .submenu li.active a {
            color: white;
        }
        .wrapper {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            height: 100vh;
            overflow: hidden;
        }
        .topbar {
            background-color: #0090d9;
            height: 50px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 0 20px;
            color: white;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .topbar-user {
            margin-right: 15px;
            font-size: 14px;
        }
        .btn-logout {
            background-color: #d9534f;
            border-color: #d43f3a;
            color: white;
            font-size: 12px;
            padding: 5px 10px;
            border-radius: 3px;
            border: 1px solid transparent;
            cursor: pointer;
        }
        .btn-logout:hover {
            background-color: #c9302c;
            color: white;
        }
        .content {
            padding: 30px;
            flex-grow: 1;
            overflow-y: auto;
        }
        .page-title {
            color: #ff0000;
            margin-top: 0;
            margin-bottom: 5px;
            font-size: 28px;
            font-weight: 500;
        }
        .page-subtitle {
            color: #777;
            font-size: 14px;
            margin-bottom: 25px;
        }
        .panel-custom {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0,0,0,0.05);
        }
        .panel-custom-header {
            padding: 10px 15px;
            background-color: #f5f5f5;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
            color: #333;
        }
        .panel-custom-body {
            padding: 15px;
        }
        .category-title {
            font-size: 24px;
            font-weight: bold;
            margin-top: 0;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">Dashboard</div>
        <div class="profile-section">
            <svg class="profile-img" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="width: 100px; height: 100px; border-radius: 50%; border: 3px solid white; display: block; margin: 0 auto 10px auto; background-color: #e0e2e5;">
                <circle cx="50" cy="37" r="18" fill="#71767a"/>
                <path d="M50 58c-18 0-30 10-32 22v4h64v-4c-2-12-14-22-32-22z" fill="#71767a"/>
            </svg>
            <div class="profile-role">Bạn là Admin</div>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-dashboard">
                <a href="#"><i class="fa fa-dashboard"></i> Dashboard</a>
            </li>
            <li class="menu-category">
                <a href="#"><i class="fa fa-folder"></i> Quản lý Danh mục</a>
                <ul class="submenu">
                    <li>
                        <a href="<c:url value='/admin/category/add'/>">- Thêm danh mục mới</a>
                    </li>
                    <li>
                        <a href="<c:url value='/admin/categories'/>">- Danh sách danh mục</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-desktop"></i> Quản lý sản phẩm</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-users"></i> Quản lý tài khoản</a>
            </li>
        </ul>
    </div>

    <div class="wrapper">
        <div class="topbar">
            <span class="topbar-user">Xin chào Thành Tài</span>
            <a href="<c:url value='/logout'/>" class="btn btn-logout">Đăng xuất</a>
        </div>

        <div class="content">
            <h1 class="page-title">Quản lý danh mục</h1>
            <p class="page-subtitle">Nơi bạn có thể quản lý danh mục của mình</p>

            <div class="panel-custom">
                <div class="panel-custom-header">Chỉnh sửa danh mục</div>
                <div class="panel-custom-body">

                    <form role="form" action="<c:url value="/admin/category/update"/>" method="post" enctype="multipart/form-data">
                        <input type="text" name="categoryid" value="${cate.categoryId}" hidden="hidden">

                        <div class="form-group">
                            <label>Category name:</label>
                            <input type="text" class="form-control" value="${cate.categoryname}" name="categoryname" />
                        </div>

                        <div class="form-group">
                            <label>Link images:</label>
                            <input type="text" class="form-control" value="${cate.images}" name="images" />
                        </div>

                        <div class="form-group">
                            <c:if test="${cate.images != null && cate.images.length() >= 5 && cate.images.substring(0,5) == 'https'}">
                                <c:url value="${cate.images}" var="imgUrl"></c:url>
                            </c:if>
                            <c:if test="${cate.images == null || cate.images.length() < 5 || cate.images.substring(0,5) != 'https'}">
                                <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                            </c:if>
                            <img class="img-responsive" width="100px" src="${imgUrl}" alt="" style="margin-bottom: 10px; border-radius: 4px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);" />
                            <br/>
                            <label>Upload images:</label>
                            <input type="file" name="images1" />
                        </div>

                        <div class="form-group">
                            <label>Status</label><br>
                            <input type="radio" id="ston" name="status" value="1" ${cate.status==1?'checked':''}>
                            <label for="ston">Hoạt động</label><br>
                            <input type="radio" id="stoff" name="status" value="0" ${cate.status!=1?'checked':''}>
                            <label for="stoff">Khóa</label>
                        </div>

                        <button type="submit" class="btn btn-default">Update</button>
                        <button type="reset" class="btn btn-primary">Reset</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
