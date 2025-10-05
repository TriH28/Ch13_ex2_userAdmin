# ===============================
# 🧱 Base image: Apache Tomcat 9 + JDK 17
# ===============================
FROM tomcat:9.0-jdk17

# Xóa webapp mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# ===============================
# 📦 Copy WAR file (đã build sẵn)
# ===============================
# Đổi tên file .war của bạn thành ROOT.war để ứng dụng chạy ở /
COPY ch13_ex2_userAdmin_war.war /usr/local/tomcat/webapps/ROOT.war

# ===============================
# 🌐 Cấu hình cổng (Render yêu cầu 8080)
# ===============================
EXPOSE 8080

# ===============================
# 🚀 Lệnh khởi động Tomcat
# ===============================
CMD ["catalina.sh", "run"]
