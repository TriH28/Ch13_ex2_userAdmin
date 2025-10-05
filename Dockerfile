# ===============================
# 🧱 Base image: Apache Tomcat 9 + JDK 17
# ===============================
FROM tomcat:9.0-jdk17

# ===============================
# ⚙️ Thiết lập thư mục làm việc
# ===============================
WORKDIR /usr/local/tomcat

# Xóa ứng dụng ROOT mặc định (Tomcat index)
RUN rm -rf webapps/ROOT

# ===============================
# 📦 Copy WAR file đã build sẵn
# ===============================
# Đổi tên file WAR của bạn thành ROOT.war để ứng dụng chạy ở domain gốc (/)
COPY ch13_ex2_userAdmin_war.war webapps/ROOT.war

# ===============================
# 🌐 Render yêu cầu port 8080
# ===============================
EXPOSE 8080

# ===============================
# 🚀 Lệnh khởi động Tomcat
# ===============================
CMD ["catalina.sh", "run"]
