# Di chuyển Ứng dụng Servlet CRUD sang JPA & Hibernate

Dự án này thực hiện việc nâng cấp ứng dụng quản lý danh mục (Category CRUD) từ sử dụng công nghệ JDBC thuần sang công nghệ **JPA (Jakarta Persistence API) và Hibernate**, kết nối cơ sở dữ liệu **Microsoft SQL Server**.

## 👤 Thông tin sinh viên
*   **Họ và tên:** Đỗ Thanh Thành Tài
*   **Mã số sinh viên:** 24133050

## 🛠️ Công nghệ sử dụng
*   **Ngôn ngữ:** Java 21 (JDK 21)
*   **Công nghệ Core:** Jakarta Servlet 10, JSP (JSTL)
*   **ORM Framework:** JPA API & Hibernate Core 6.6.1.Final
*   **Cơ sở dữ liệu:** Microsoft SQL Server
*   **Build Tool:** Maven
*   **Server chạy kiểm thử:** Jetty Engine (Jetty 12 EE10) thông qua plugin `jetty-ee10-maven-plugin`

## 📂 Cấu trúc thư mục dự án
*   `src/main/java/vn/iotstar/config`: Cấu hình `EntityManagerFactory` trong `JPAConfig.java` để sinh đối tượng kết nối `EntityManager`.
*   `src/main/java/vn/iotstar/entity`: Định nghĩa các Entity (`Category`, `Video`) và ánh xạ (mapping) trực tiếp tới các bảng dữ liệu trong SQL Server bằng Annotation JPA.
*   `src/main/java/vn/iotstar/dao`: Thực thi thao tác CRUD thông qua `EntityManager` (thay cho JDBC `PreparedStatement`).
*   `src/main/java/vn/iotstar/service`: Lớp nghiệp vụ trung gian xử lý kiểm tra trùng lặp danh mục trước khi lưu.
*   `src/main/java/vn/iotstar/controller`: Quản lý điều hướng URL và xử lý tải lên tệp tin (Multipart File Upload).
*   `src/main/resources/META-INF/persistence.xml`: Chứa toàn bộ cấu hình kết nối SQL Server và chế độ tự sinh cấu trúc bảng (`hibernate.hbm2ddl.auto = update`).
*   `src/main/webapp/views/admin`: Các file JSP hiển thị giao diện danh sách, thêm và chỉnh sửa danh mục theo phong cách sidebar hiện đại.

## 💾 Hướng dẫn cấu hình Cơ sở dữ liệu (SQL Server)
1.  Đảm bảo dịch vụ SQL Server của bạn đang hoạt động (ví dụ sử dụng phiên bản `SQLEXPRESS`).
2.  Tài khoản đăng nhập SQL Server mặc định được cấu hình trong `persistence.xml` là:
    *   **User:** `sa`
    *   **Password:** `22092006`
3.  Tạo một Database rỗng có tên là: **`jakartaJPA`** trong SQL Server của bạn. 
4.  Khi ứng dụng khởi chạy lần đầu, Hibernate sẽ tự động tạo cấu trúc bảng (`categories` và `videos`) vào database này mà không cần chạy file SQL DDL thủ công.

## 🚀 Hướng dẫn khởi chạy dự án

### Cách 1: Chạy trực tiếp từ Spring Tool Suite (STS)
1.  Nhấp chuột phải vào dự án **JPA** -> Chọn **Run As** -> **Maven Build...**
2.  Nhập goal chạy: `jetty:run` vào ô **Goals**.
3.  Nhấn **Run**. Đợi log console hiển thị cổng chạy thành công (mặc định là cổng `8083`).
4.  Truy cập liên kết quản trị danh mục trên trình duyệt:  
    👉 `http://localhost:8083/JPA/admin/categories`

### Cách 2: Chạy bằng dòng lệnh ngoài (Terminal/CMD)
1.  Mở Command Prompt hoặc PowerShell và di chuyển vào thư mục dự án:
    ```cmd
    cd "c:\Users\dotai\Documents\workspace-spring-tools-for-eclipse-5.3.0.RELEASE\JPA"
    ```
2.  Dọn dẹp và chạy ứng dụng:
    ```cmd
    mvn clean compile jetty:run
    ```
3.  Mở trình duyệt truy cập: `http://localhost:8083/JPA/admin/categories`
