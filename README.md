# dorm_hub
## 高校宿舍交流信息管理平台
[PC端在线演示地址](http://49.235.92.49/)
### 项目概述
边学边做实现的一个CRUD项目，主要是供师生使用的以宿舍生活为主体的软件系统。还有很多地方未完善和优化。
项目由移动端网页，PC端网页，后端服务三个部分构成。

#### 结构
dorm-java 后端代码 [自行配置application]

dorm-web 前端代码
 + dorm-web 移动端项目 [npm install + npm run serve]
 + dorm-admin PC端项目 [npm install + npm run dev]

**包含功能**

1. [x] 卫生检查
2. [x] 预约床位
3. [x] 请假
4. [x] 报修处理
5. [x] 校内发帖
6. [x] 在线聊天
7. [x] 权限管理

### 开发涉及技术

- SpringBoot
- SpringSecurity + Jwt
- Mybatis-Plus
- MySQL 8.0+
- redis
- easy-poi
- 腾讯云 对象储存COS
- stomp & websocket
- Vue全家桶
- Vant UI & Element UI
- vue-admin-template
- ECharts
