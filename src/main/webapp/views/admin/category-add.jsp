<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Danh Mục - DT SHOP Admin</title>
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
            margin-bottom: 25px;
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
        }
        .card-custom {
            background: white;
            border-radius: 20px;
            border: 1px solid #f1f5f9;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
            max-width: 800px;
            overflow: hidden;
        }
        .card-custom-header {
            padding: 20px 24px;
            border-bottom: 1px solid #f1f5f9;
            font-weight: 700;
            font-size: 1.05rem;
            color: #0f172a;
        }
        .card-custom-body {
            padding: 30px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="<c:url value='/admin/categories'/>" class="sidebar-brand">
            <div class="brand-logo-icon"><i class="fa-solid fa-cube"></i></div>
            <div>
                <div class="brand-name">DT SHOP</div>
                <div style="font-size: 0.72rem; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px;">Admin Console</div>
            </div>
        </a>

        <div class="admin-profile-box">
            <div class="admin-avatar"><i class="fa-solid fa-user-shield"></i></div>
            <div style="overflow: hidden;">
                <div class="fw-bold text-white text-truncate small">
                    ${sessionScope.account != null && not empty sessionScope.account.fullname ? sessionScope.account.fullname : 'Admin DT SHOP'}
                </div>
                <div class="text-secondary small d-flex align-items-center mt-1" style="font-size: 0.75rem;">
                    <span class="status-dot"></span> Đang hoạt động
                </div>
            </div>
        </div>

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
                    <li><a href="<c:url value='/admin/categories'/>" class="submenu-link"><i class="fa-solid fa-list me-1"></i> Danh sách danh mục</a></li>
                    <li><a href="<c:url value='/admin/category/add'/>" class="submenu-link active"><i class="fa-solid fa-plus me-1"></i> Thêm danh mục mới</a></li>
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

    <!-- Main Content -->
    <div class="wrapper">
        <div class="topbar">
            <span class="badge bg-primary-subtle text-primary fw-semibold px-3 py-2 rounded-pill">
                <i class="fa-solid fa-database me-1"></i> SQL Server: jakartaJPA
            </span>
            <div class="d-flex align-items-center gap-3">
                <span class="text-secondary small">
                    Xin chào, <strong>${sessionScope.account != null && not empty sessionScope.account.fullname ? sessionScope.account.fullname : 'Quản Trị Viên'}</strong>
                </span>
                <a href="<c:url value='/logout'/>" class="btn btn-sm btn-outline-danger rounded-pill px-3">
                    <i class="fa-solid fa-arrow-right-from-bracket me-1"></i> Đăng xuất
                </a>
            </div>
        </div>

        <div class="content">
            <div class="page-header-box">
                <h1 class="page-title">Thêm Danh Mục Mới</h1>
                <p class="page-subtitle">Nhập thông tin để tạo danh mục sản phẩm mới trên hệ thống DT SHOP</p>
            </div>

            <div class="card-custom">
                <div class="card-custom-header">
                    <i class="fa-solid fa-circle-plus text-primary me-2"></i> Form Thông Tin Danh Mục
                </div>
                <div class="card-custom-body">
                    <form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
                        <div class="mb-4">
                            <label class="form-label fw-semibold text-secondary small">Tên Danh Mục <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control-lg" name="categoryname" placeholder="ví dụ: Điện thoại, Laptop, Phụ kiện..." required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-semibold text-secondary small">Trạng Thái Hoạt Động</label>
                            <select class="form-select" name="status">
                                <option value="1" selected>Hoạt động (Hiển thị cho khách hàng)</option>
                                <option value="0">Khóa (Tạm ẩn danh mục)</option>
                            </select>
                        </div>

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold text-secondary small">Tải Ảnh Lên Từ Thiết Bị</label>
                                <input type="file" class="form-control" name="images1" accept="image/*">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold text-secondary small">Hoặc Dán Đường Dẫn URL Ảnh Trực Tiếp</label>
                                <input type="text" class="form-control" name="images" placeholder="https://example.com/image.jpg">
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-3 pt-3 border-top">
                            <a href="<c:url value='/admin/categories'/>" class="btn btn-outline-secondary rounded-pill px-4">
                                <i class="fa-solid fa-arrow-left me-2"></i> Quay lại
                            </a>
                            <button type="submit" class="btn btn-primary rounded-pill px-4 fw-bold shadow">
                                <i class="fa-solid fa-check me-2"></i> Lưu Danh Mục
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
