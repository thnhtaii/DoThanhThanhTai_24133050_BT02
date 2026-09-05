# DT SHOP - HỆ THỐNG QUẢN LÝ VÀ THƯƠNG MẠI ĐIỆN TỬ

---

## 👤 Thông Tin Sinh Viên
* **Họ và tên:** Đỗ Thanh Thành Tài
* **Mã số sinh viên (MSSV):** 24133050
* **Môi trường IDE:** Spring Tool Suite (STS) 5.3.0.RELEASE / Eclipse / VS Code

---

## 🌟 Giới Thiệu Dự Án
Dự án được xây dựng trên nền tảng **Jakarta EE 10** hiện đại, chuyển đổi toàn bộ kiến trúc truy xuất dữ liệu từ JDBC thuần sang **JPA (Jakarta Persistence API)** với **Hibernate ORM 6.6.1**, kết nối cơ sở dữ liệu **Microsoft SQL Server (tương thích SQL Server Management Studio 2025 - SSMS)**.

Hệ thống được thiết kế theo mô hình **MVC (Model - View - Controller)** nhiều tầng phân tách rõ ràng, tích hợp hệ thống xác thực an toàn bằng mã băm **SHA-256** và **mã OTP 6 số gửi qua Email**, kèm theo giao diện người dùng và bảng điều khiển quản trị (Admin Console) hiện đại, trực quan mang thương hiệu **DT SHOP**.

---

## 🛠️ Công Nghệ Sử Dụng (Tech Stack)

| Thành phần | Công nghệ / Thư viện | Phiên bản |
| :--- | :--- | :--- |
| **Ngôn ngữ** | Java (JDK) | Java 21 LTS |
| **Nền tảng Web** | Jakarta Servlet, JSP | Jakarta EE 10 (Servlet 6.0) |
| **Thẻ hiển thị** | Jakarta Standard Tag Library (JSTL) | 3.0.1 |
| **ORM Framework** | Jakarta Persistence API (JPA) & Hibernate Core | 6.6.1.Final |
| **Cơ sở dữ liệu** | Microsoft SQL Server (SSMS 2025) | MSSQL JDBC 12.8.1 |
| **Bảo mật & Mã hóa** | MessageDigest SHA-256 | Java Security Core |
| **Hệ thống Email OTP**| Jakarta Mail & Eclipse Angus Mail | 2.1.3 / 2.0.3 |
| **Giao diện (Frontend)**| Bootstrap 5, FontAwesome 6, Plus Jakarta Sans | 5.3.0 |
| **Build Tool** | Apache Maven | Maven 3.9+ |
| **Web Server** | Apache Tomcat 10+ / Eclipse WTP (Port 8080) hoặc Jetty Engine 12 (Port 8083) | EE10 |

---

## 📋 Danh Sách Chức Năng Đã Hoàn Thành (8/8 Mục Yêu Cầu)

### 1. Kích hoạt tài khoản bằng mã OTP gửi qua Email khi Đăng ký
* **URL:** `/register`, `/verify-otp`, `/resend-otp`
* **Mô tả:** 
  - Người dùng đăng ký tài khoản mới với các trường: tên đăng nhập, họ tên, email, mật khẩu.
  - Hệ thống tự động sinh mã OTP ngẫu nhiên gồm 6 chữ số có thời hạn hiệu lực trong **5 phút**.
  - Mã OTP được gửi qua email dưới dạng thư HTML sang trọng, đồng thời **luôn được in ra cửa sổ Console** của server giúp việc kiểm thử nhanh chóng và dễ dàng.
  - Người dùng nhập đúng mã OTP tại giao diện `/verify-otp` để kích hoạt tài khoản (`status = 1`). Hỗ trợ nút **Gửi lại mã OTP** nếu mã hết hạn.

### 2. Chức năng Đăng nhập & Đăng xuất (Authentication)
* **URL:** `/login`, `/logout`
* **Mô tả:**
  - Hỗ trợ đăng nhập linh hoạt bằng **Tên đăng nhập** hoặc **Địa chỉ Email**.
  - Toàn bộ mật khẩu được băm bảo mật bằng thuật toán **SHA-256** (`PasswordUtil.java`), không lưu mật khẩu dạng bản rõ.
  - Kiểm tra trạng thái tài khoản: Nếu tài khoản chưa kích hoạt, hệ thống sẽ tự động nhắc nhở và chuyển hướng người dùng đến trang xác thực OTP.
  - Tự động điều hướng thông minh sau đăng nhập:
    - Tài khoản **Quản trị viên (Admin - roleId = 1)**: Điều hướng vào trang quản trị `/admin/categories`.
    - Tài khoản **Người dùng (User - roleId = 2)**: Điều hướng vào trang mua sắm `/home`.

### 3. Quên mật khẩu gửi xác nhận OTP qua Email & Đặt lại mật khẩu
* **URL:** `/forgot-password`, `/reset-password`
* **Mô tả:**
  - Người dùng nhập địa chỉ email đã đăng ký tại `/forgot-password`.
  - Hệ thống kiểm tra tài khoản, sinh mã OTP khôi phục mật khẩu mới và gửi về hòm thư người dùng.
  - Tại trang `/reset-password`, người dùng nhập mã OTP và mật khẩu mới để đặt lại mật khẩu mà không cần mật khẩu cũ.

### 4. Thiết kế bảng Products & Quan hệ 1 - N với Categories
* **Mô tả:**
  - Entity `Product.java` ánh xạ bảng `products` trong SQL Server.
  - Thiết lập liên kết khóa ngoại **1 - N** giữa `Category` và `Product` thông qua JPA annotations:
    - `@ManyToOne` `@JoinColumn(name = "categoryId")` ở `Product.java`.
    - `@OneToMany(mappedBy = "category")` ở `Category.java`.
  - Cơ chế xóa an toàn (Safe-Delete): Khi xóa danh mục, hệ thống tự động gỡ liên kết danh mục ở các sản phẩm con để tránh xung đột ràng buộc khóa ngoại trong SQL Server.

### 5. Thực hiện đầy đủ CRUD cho Quản lý Sản phẩm (Products)
* **URL:** `/admin/products`, `/admin/product/add`, `/admin/product/edit`, `/admin/product/delete`
* **Mô tả:**
  - **Create (Thêm mới):** Hỗ trợ form nhập đầy đủ thông tin: tên sản phẩm, giá bán, số lượng tồn kho, danh mục liên kết, trạng thái và tải ảnh trực tiếp từ máy tính (Multipart Upload) hoặc dán link ảnh online.
  - **Read (Xem danh sách):** Hiển thị danh sách sản phẩm trực quan, định dạng tiền tệ VNĐ, trạng thái hoạt động và ảnh đại diện có fallback SVG chống vỡ ảnh.
  - **Update (Cập nhật):** Chỉnh sửa mọi thông số sản phẩm, có preview ảnh hiện tại.
  - **Delete (Xóa):** Sử dụng **Bootstrap Modal popup** xác nhận xóa trực tiếp trên màn hình, không dùng alert mặc định của trình duyệt, đi kèm thông báo thành công đẹp mắt.

### 6. Hiển thị 10 Sản phẩm mới nhất lên Trang chủ
* **URL:** `/home`
* **Mô tả:**
  - Trang chủ DT SHOP truy vấn cơ sở dữ liệu sắp xếp theo ngày đăng mới nhất (`createDate DESC`) lấy chính xác **10 sản phẩm mới nhất**.
  - Các sản phẩm được gắn badge **"Mới"** nổi bật, kèm theo danh sách các danh mục nổi bật phía trên.

### 7. Hiển thị tất cả sản phẩm phân trang 6 sản phẩm/trang tại URL `/product`
* **URL:** `/product`
* **Mô tả:**
  - Cố định phân trang đúng **6 sản phẩm / trang** (`PAGE_SIZE = 6`) theo yêu cầu đề bài.
  - Bố cục lưới sản phẩm cân đối (2 hàng x 3 cột).
  - Thanh phân trang chuyên nghiệp với nút chuyển trang `1, 2, 3...`, nút `Trước`, `Sau`.
  - Tích hợp bộ lọc danh mục bên sidebar và thanh tìm kiếm từ khóa sản phẩm.
  - Giao diện đã được dọn sạch toàn bộ các khối nội dung thừa hoặc không liên quan.

### 8. Hiển thị chi tiết 01 sản phẩm khi bấm chuột từ Trang chủ hoặc Trang `/product`
* **URL:** `/product/detail?id={id}`
* **Mô tả:**
  - Khi click vào bất kỳ sản phẩm nào trên Trang chủ (`/home`) hoặc Trang danh sách (`/product`), người dùng được điều hướng tới trang chi tiết.
  - Hiển thị hình ảnh chi tiết kích thước lớn, tên sản phẩm, danh mục, giá bán định dạng tiền tệ (₫), tình trạng tồn kho, mô tả chi tiết và ngày đăng.
  - Tích hợp thêm mục **"Sản phẩm cùng danh mục"** giúp người dùng xem thêm các sản phẩm liên quan.

---

## 🎨 Giao Diện & Trải Nghiệm Người Dùng DT SHOP

* **Nhận diện thương hiệu DT SHOP:** Tông màu chủ đạo là xanh công nghệ (`#2563eb`) kết hợp nền Slate tối sang trọng (`#0f172a`), font chữ chuẩn quốc tế **Plus Jakarta Sans**.
* **Menu Sidebar đa cấp linh hoạt:** Phân chia rõ ràng giữa "Quản lý Danh mục" và "Quản lý Sản phẩm". Mỗi mục có **nút mũi tên cuộn (chevron button)** cho phép bấm đóng/mở danh sách chức năng con một cách độc lập và mượt mà.
* **Modal xác nhận xóa in-page:** Loại bỏ hoàn toàn hộp thoại `localhost:8080 says` mặc định, thay thế bằng cửa sổ popup Modal Bootstrap 5 thiết kế riêng với hiệu ứng mềm mại.
* **Xử lý ảnh đại diện thông minh:** Bộ điều khiển `DownloadImageController` tích hợp ảnh SVG vector làm hình mặc định, đảm bảo không bao giờ xuất hiện icon ảnh bị gãy (broken image) trên website.

---

## 💾 Cấu Hình Cơ Sở Dữ Liệu (SQL Server & SSMS 2025)

Cấu hình JPA kết nối CSDL được đặt trong file `src/main/resources/META-INF/persistence.xml`:

```xml
<property name="jakarta.persistence.jdbc.url" 
          value="jdbc:sqlserver://localhost:64590;databaseName=jakartaJPA;encrypt=true;trustServerCertificate=true" />
<property name="jakarta.persistence.jdbc.driver" value="com.microsoft.sqlserver.jdbc.SQLServerDriver" />
<property name="jakarta.persistence.jdbc.user" value="sa" />
<property name="jakarta.persistence.jdbc.password" value="22092006" />
<property name="hibernate.hbm2ddl.auto" value="update" />
<property name="hibernate.dialect" value="org.hibernate.dialect.SQLServerDialect" />
```

### Các bước cài đặt CSDL trong SQL Server Management Studio (SSMS 2025):
1. Khởi động **SQL Server Management Studio 2025 (SSMS)**.
2. Kết nối tới SQL Server instance của bạn:
   - Server name: `localhost,64590` (hoặc `.\SQLEXPRESS` / `localhost\SQLEXPRESS`).
   - Authentication: **SQL Server Authentication**.
   - Login: `sa` | Password: `22092006` (hoặc tài khoản sa trên máy của bạn).
3. Mở cửa sổ truy vấn mới (**New Query**) và tạo database:
   ```sql
   CREATE DATABASE jakartaJPA;
   GO
   ```
4. **Không cần tạo bảng thủ công!** Khi ứng dụng khởi chạy, Hibernate sẽ tự động tạo và ánh xạ đầy đủ 4 bảng:
   - `categories`
   - `products`
   - `users`
   - `videos`

---

## 👥 Danh Sách Tài Khoản Kiểm Thử Mẫu

| Loại tài khoản | Tên đăng nhập / Email | Mật khẩu | Quyền hạn (Role) | Chú thích |
| :--- | :--- | :--- | :--- | :--- |
| **Admin** | `admin` | `admin123` | Quản trị viên (roleId = 1) | Quản lý Category & Product |
| **User** | `testuser` / `testuser@iotstar.vn` | `123456` | Người dùng (roleId = 2) | Mua sắm, xem sản phẩm |
| **Khách mới** | *(Tùy ý đăng ký tại `/register`)* | *(Tùy chọn)* | Người dùng (roleId = 2) | Kích hoạt bằng mã OTP gửi qua Email |

> 💡 **Mẹo:** Khi đăng ký tài khoản mới hoặc quên mật khẩu, mã OTP luôn hiển thị trực tiếp trên cửa sổ **Console / Terminal** của Eclipse/STS hoặc Jetty Server để thuận tiện kiểm thử ngay lập tức mà không phụ thuộc vào kết nối mạng.

---

## 🚀 Hướng Dẫn Cài Đặt & Khởi Chạy Ứng Dụng

### Cách 1: Chạy bằng Eclipse / Spring Tool Suite (Khuyến nghị)
1. Mở **Spring Tool Suite (STS)** hoặc **Eclipse**.
2. Chọn thư mục Workspace: `c:\Users\dotai\Documents\workspace-spring-tools-for-eclipse-5.3.0.RELEASE`.
3. Nhấp chuột phải vào dự án **JPA** -> Chọn **Run As** -> **Run on Server** (chọn **Apache Tomcat 10+**).
4. Mở trình duyệt và truy cập:
   - Trang chủ cửa hàng: 👉 `http://localhost:8080/JPA/home`
   - Danh sách sản phẩm: 👉 `http://localhost:8080/JPA/product`
   - Quản trị danh mục: 👉 `http://localhost:8080/JPA/admin/categories`
   - Quản trị sản phẩm: 👉 `http://localhost:8080/JPA/admin/products`
   - Đăng nhập: 👉 `http://localhost:8080/JPA/login`

---

### Cách 2: Chạy bằng Maven Jetty Server (Dòng lệnh)
1. Mở **PowerShell** hoặc **Command Prompt** tại thư mục gốc dự án:
   ```cmd
   cd "c:\Users\dotai\Documents\workspace-spring-tools-for-eclipse-5.3.0.RELEASE\JPA"
   ```
2. Biên dịch và khởi động máy chủ Jetty:
   ```cmd
   mvn clean compile jetty:run
   ```
3. Sau khi màn hình hiển thị `Started ServerConnector@... {HTTP/1.1, (http/1.1)}:8083`, truy cập:
   - Trang chủ cửa hàng: 👉 `http://localhost:8083/JPA/home`
   - Quản trị danh mục: 👉 `http://localhost:8083/JPA/admin/categories`
   - Quản trị sản phẩm: 👉 `http://localhost:8083/JPA/admin/products`

---

### Cách 3: Nạp Dữ Liệu Mẫu Kiểm Thử Tự Động
Dự án có sẵn class `vn.iotstar.test.DatabaseInitTest` để nạp tự động tài khoản admin, các danh mục và 12 sản phẩm mẫu vào SQL Server. Để chạy:
* Trong Eclipse/STS: Chuột phải vào file `DatabaseInitTest.java` -> Chọn **Run As** -> **Java Application**.
* Bằng Maven:
  ```cmd
  mvn test-compile exec:java -Dexec.mainClass="vn.iotstar.test.DatabaseInitTest"
  ```

---

## 📁 Cấu Trúc Mã Nguồn Dự Án

```
JPA/
├── src/main/java/vn/iotstar/
│   ├── config/
│   │   └── JPAConfig.java                    # Quản lý EntityManagerFactory & kết nối JPA
│   ├── controller/
│   │   ├── AuthController.java               # Đăng nhập, Đăng ký, OTP, Quên/Đổi mật khẩu
│   │   ├── CategoryController.java           # Quản trị Danh mục (CRUD Category)
│   │   ├── DownloadImageController.java      # Trả ảnh từ thư mục upload hoặc SVG fallback
│   │   ├── HomeController.java               # Trang chủ (Top 10 sản phẩm mới nhất)
│   │   ├── ProductAdminController.java       # Quản trị Sản phẩm (CRUD Product)
│   │   └── ProductWebController.java         # Danh sách sản phẩm (phân trang 6sp) & Chi tiết
│   ├── dao/
│   │   ├── CategoryDao.java & ICategoryDao   # Tầng DAO xử lý CSDL Danh mục
│   │   ├── ProductDao.java & IProductDao     # Tầng DAO xử lý CSDL Sản phẩm & Phân trang
│   │   └── UserDao.java & IUserDao           # Tầng DAO xử lý CSDL Người dùng & OTP
│   ├── entity/
│   │   ├── Category.java                     # Entity Danh mục (@OneToMany với Product)
│   │   ├── Product.java                      # Entity Sản phẩm (@ManyToOne với Category)
│   │   ├── User.java                         # Entity Người dùng, vai trò và thông tin OTP
│   │   └── Video.java                        # Entity Video giới thiệu
│   ├── service/
│   │   ├── CategoryServiceImpl.java          # Nghiệp vụ Danh mục
│   │   ├── ProductServiceImpl.java           # Nghiệp vụ Sản phẩm
│   │   └── UserServiceImpl.java              # Nghiệp vụ Đăng ký, OTP, Đăng nhập, Đổi mật khẩu
│   └── utils/
│       ├── Constant.java                     # Hằng số hệ thống (Page size, thư mục upload, email)
│       ├── EmailUtil.java                    # Sinh OTP & gửi email qua Jakarta Mail
│       └── PasswordUtil.java                 # Băm & kiểm tra mật khẩu bằng SHA-256
├── src/main/resources/
│   └── META-INF/
│       └── persistence.xml                   # Cấu hình kết nối SQL Server và Hibernate DDL
├── src/main/webapp/
│   ├── views/
│   │   ├── admin/
│   │   │   ├── category-list.jsp             # Danh sách danh mục (kèm Modal xóa)
│   │   │   ├── category-add.jsp              # Thêm danh mục
│   │   │   ├── category-edit.jsp             # Sửa danh mục
│   │   │   ├── product-list.jsp              # Danh sách sản phẩm (kèm Modal xóa)
│   │   │   ├── product-add.jsp               # Thêm sản phẩm
│   │   │   └── product-edit.jsp              # Sửa sản phẩm
│   │   └── web/
│   │       ├── home.jsp                      # Trang chủ (10 sản phẩm mới nhất)
│   │       ├── product-list.jsp              # Danh mục sản phẩm phân trang 6sp/trang
│   │       ├── product-detail.jsp            # Chi tiết sản phẩm & sản phẩm cùng loại
│   │       ├── login.jsp                     # Trang đăng nhập
│   │       ├── register.jsp                  # Trang đăng ký nhận mã OTP
│   │       ├── verify-otp.jsp                # Trang kích hoạt OTP
│   │       ├── forgot-password.jsp           # Trang yêu cầu OTP quên mật khẩu
│   │       └── reset-password.jsp            # Trang đặt lại mật khẩu mới
│   ├── WEB-INF/
│   │   └── web.xml                           # Cấu hình Web Descriptor
│   └── index.jsp                             # Điều hướng mặc định về /home
├── src/test/java/vn/iotstar/test/
│   └── DatabaseInitTest.java                 # Class khởi tạo dữ liệu mẫu và test toàn hệ thống
├── pom.xml                                   # Cấu hình Maven dependencies & plugins
└── README.md                                 # Tài liệu hướng dẫn đồ án chi tiết
```

---
*Dự án hoàn thành bởi sinh viên **Đỗ Thanh Thành Tài - MSSV: 24133050**.*
