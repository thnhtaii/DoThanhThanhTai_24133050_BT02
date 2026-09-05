<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Danh Mục - DT SHOP Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --sidebar-bg: #0f172a;
            --sidebar-hover: #1e293b;
            --sidebar-active: #2563eb;
            --content-bg: #f8fafc;
        }
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--content-bg);
            color: #1e293b;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        /* Sidebar */
        .sidebar {
            width: 270px;
            background-color: var(--sidebar-bg);
            color: #f8fafc;
            display: flex;
            flex-direction: column;
            flex-shrink: 0;
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.08);
            z-index: 100;
        }
        .sidebar-brand {
            padding: 24px 20px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            text-decoration: none;
            color: white;
        }
        .sidebar-brand:hover {
            color: white;
        }
        .brand-logo-icon {
            width: 42px;
            height: 42px;
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: white;
            margin-right: 12px;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
        }
        .brand-name {
            font-size: 1.25rem;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .admin-profile-box {
            padding: 20px;
            margin: 15px;
            background: rgba(255, 255, 255, 0.04);
            border-radius: 16px;
            border: 1px solid rgba(255, 255, 255, 0.06);
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .admin-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            color: white;
            font-size: 1.1rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            flex-shrink: 0;
        }
        .status-dot {
            width: 8px;
            height: 8px;
            background-color: #22c55e;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 0 8px #22c55e;
            margin-right: 4px;
        }
        .sidebar-menu {
            list-style: none;
            padding: 10px 15px;
            margin: 0;
            overflow-y: auto;
            flex-grow: 1;
        }
        .menu-header {
            font-size: 0.72rem;
            text-transform: uppercase;
            font-weight: 700;
            color: #64748b;
            padding: 12px 12px 6px 12px;
            letter-spacing: 0.8px;
        }
        .sidebar-item {
            margin-bottom: 4px;
        }
        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 11px 14px;
            color: #94a3b8;
            text-decoration: none;
            border-radius: 12px;
            font-size: 0.92rem;
            font-weight: 500;
            transition: all 0.2s;
        }
        .sidebar-link i {
            width: 22px;
            font-size: 1.05rem;
            margin-right: 12px;
            text-align: center;
        }
        .sidebar-link:hover {
            background-color: var(--sidebar-hover);
            color: white;
        }
        .sidebar-link.active {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            color: white;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.35);
        }
        .submenu {
            list-style: none;
            padding-left: 36px;
            margin: 4px 0 8px 0;
        }
        .submenu-link {
            display: block;
            padding: 7px 12px;
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.86rem;
            border-radius: 8px;
            transition: all 0.2s;
        }
        .submenu-link:hover {
            color: white;
            background-color: rgba(255, 255, 255, 0.05);
        }
        .submenu-link.active {
            color: #60a5fa;
            font-weight: 600;
        }

        /* Main Wrapper */
        .wrapper {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            height: 100vh;
            overflow: hidden;
        }
        .topbar {
            background-color: white;
            height: 68px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 30px;
            border-bottom: 1px solid #e2e8f0;
            box-shadow: 0 1px 4px rgba(0,0,0,0.02);
            flex-shrink: 0;
        }
        .content {
            padding: 30px;
            flex-grow: 1;
            overflow-y: auto;
        }
        .page-header-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }
        .page-title {
            color: #0f172a;
            font-size: 1.75rem;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin: 0;
        }
        .page-subtitle {
            color: #64748b;
            font-size: 0.9rem;
            margin-top: 4px;
            margin-bottom: 0;
        }

        /* Modern Table Card */
        .card-custom {
            background: white;
            border-radius: 20px;
            border: 1px solid #f1f5f9;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
            overflow: hidden;
        }
        .card-custom-header {
            padding: 20px 24px;
            border-bottom: 1px solid #f1f5f9;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        .category-thumb {
            width: 80px;
            height: 80px;
            border-radius: 14px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.04);
            background-color: #f8fafc;
        }
        .table-custom {
            margin-bottom: 0;
        }
        .table-custom th {
            background-color: #f8fafc;
            color: #475569;
            font-weight: 700;
            font-size: 0.82rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 16px 20px;
            border-bottom: 1px solid #e2e8f0;
        }
        .table-custom td {
            padding: 16px 20px;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
        }
        .table-custom tbody tr:hover {
            background-color: #f8fafc;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="<c:url value='/admin/categories'/>" class="sidebar-brand">
            <div class="brand-logo-icon">
                <i class="fa-solid fa-cube"></i>
            </div>
            <div>
                <div class="brand-name">DT SHOP</div>
                <div style="font-size: 0.72rem; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px;">Admin Console</div>
            </div>
        </a>

        <!-- Admin Profile -->
        <div class="admin-profile-box">
            <div class="admin-avatar">
                <i class="fa-solid fa-user-shield"></i>
            </div>
            <div style="overflow: hidden;">
                <div class="fw-bold text-white text-truncate small">
                    ${sessionScope.account != null && not empty sessionScope.account.fullname ? sessionScope.account.fullname : 'Admin DT SHOP'}
                </div>
                <div class="text-secondary small d-flex align-items-center mt-1" style="font-size: 0.75rem;">
                    <span class="status-dot"></span> Đang hoạt động
                </div>
            </div>
        </div>

        <!-- Navigation Menu -->
        <ul class="sidebar-menu">
            <div class="menu-header">Hệ thống & Cửa hàng</div>
            <li class="sidebar-item">
                <a href="<c:url value='/home'/>" target="_blank" class="sidebar-link">
                    <i class="fa-solid fa-store text-primary"></i> Xem Cửa Hàng (DT SHOP)
                </a>
            </li>

            <div class="menu-header">Quản trị dữ liệu</div>
            <li class="sidebar-item">
                <a href="<c:url value='/admin/categories'/>" class="sidebar-link active">
                    <i class="fa-solid fa-folder-tree"></i> Quản lý Danh mục
                </a>
                <ul class="submenu">
                    <li><a href="<c:url value='/admin/categories'/>" class="submenu-link active"><i class="fa-solid fa-list me-1"></i> Danh sách danh mục</a></li>
                    <li><a href="<c:url value='/admin/category/add'/>" class="submenu-link"><i class="fa-solid fa-plus me-1"></i> Thêm danh mục mới</a></li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="<c:url value='/admin/products'/>" class="sidebar-link">
                    <i class="fa-solid fa-box-open"></i> Quản lý Sản phẩm
                </a>
                <ul class="submenu">
                    <li><a href="<c:url value='/admin/products'/>" class="submenu-link"><i class="fa-solid fa-list me-1"></i> Danh sách sản phẩm</a></li>
                    <li><a href="<c:url value='/admin/product/add'/>" class="submenu-link"><i class="fa-solid fa-plus me-1"></i> Thêm sản phẩm mới</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- Main Wrapper -->
    <div class="wrapper">
        <!-- Topbar -->
        <div class="topbar">
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-primary-subtle text-primary fw-semibold px-3 py-2 rounded-pill">
                    <i class="fa-solid fa-database me-1"></i> SQL Server: jakartaJPA
                </span>
            </div>

            <div class="d-flex align-items-center gap-3">
                <span class="text-secondary small">
                    Xin chào, <strong>${sessionScope.account != null && not empty sessionScope.account.fullname ? sessionScope.account.fullname : 'Quản Trị Viên'}</strong>
                </span>
                <a href="<c:url value='/logout'/>" class="btn btn-sm btn-outline-danger rounded-pill px-3">
                    <i class="fa-solid fa-arrow-right-from-bracket me-1"></i> Đăng xuất
                </a>
            </div>
        </div>

        <!-- Content Area -->
        <div class="content">
            <!-- Header with Title & Add Button -->
            <div class="page-header-box">
                <div>
                    <h1 class="page-title">Quản Lý Danh Mục</h1>
                    <p class="page-subtitle">Xem, quản lý và chỉnh sửa toàn bộ các danh mục sản phẩm của DT SHOP</p>
                </div>
                <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary btn-lg rounded-pill px-4 shadow-sm fw-bold">
                    <i class="fa-solid fa-circle-plus me-2"></i> Thêm Danh Mục Mới
                </a>
            </div>

            <!-- Table Card -->
            <div class="card-custom">
                <div class="card-custom-header">
                    <div class="fw-bold fs-6 text-dark d-flex align-items-center gap-2">
                        <i class="fa-solid fa-table-list text-primary"></i> Danh Sách Danh Mục
                        <span class="badge bg-primary rounded-pill ms-2">${listcate != null ? listcate.size() : 0} danh mục</span>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-custom align-middle">
                        <thead>
                            <tr>
                                <th style="width: 70px;" class="text-center">STT</th>
                                <th style="width: 110px;" class="text-center">Hình Ảnh</th>
                                <th>Tên Danh Mục</th>
                                <th style="width: 150px;" class="text-center">Trạng Thái</th>
                                <th style="width: 180px;" class="text-center">Hành Động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty listcate}">
                                    <c:forEach items="${listcate}" var="cate" varStatus="STT">
                                        <tr>
                                            <td class="text-center fw-bold text-secondary">${STT.index + 1}</td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${cate.images != null && cate.images.startsWith('http')}">
                                                        <img class="category-thumb" src="${cate.images}" alt="${cate.categoryname}" onerror="this.onerror=null; this.src='<c:url value='/image?fname=default'/>';">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="category-thumb" src="<c:url value='/image?fname=${cate.images}'/>" alt="${cate.categoryname}" onerror="this.onerror=null; this.src='<c:url value='/image?fname=default'/>';">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="fw-bold text-dark fs-6">${cate.categoryname}</div>
                                                <div class="small text-muted">ID Danh mục: #${cate.categoryId}</div>
                                            </td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${cate.status == 1}">
                                                        <span class="badge bg-success-subtle text-success border border-success-subtle px-3 py-2 rounded-pill fw-semibold">
                                                            <i class="fa-solid fa-circle-check me-1"></i> Hoạt động
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-3 py-2 rounded-pill fw-semibold">
                                                            <i class="fa-solid fa-lock me-1"></i> Khóa
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <div class="d-inline-flex gap-2">
                                                    <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>" class="btn btn-sm btn-outline-primary rounded-pill px-3">
                                                        <i class="fa-solid fa-pen-to-square me-1"></i> Sửa
                                                    </a>
                                                    <a href="<c:url value='/admin/category/delete?id=${cate.categoryId}'/>" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục [${cate.categoryname}] không?')" class="btn btn-sm btn-outline-danger rounded-pill px-3">
                                                        <i class="fa-solid fa-trash-can me-1"></i> Xóa
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" class="text-center py-5 text-muted">
                                            <i class="fa-solid fa-folder-open mb-3 text-secondary" style="font-size: 48px;"></i>
                                            <p class="mb-0">Chưa có danh mục nào. Hãy bấm <strong>Thêm Danh Mục Mới</strong> để tạo!</p>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
