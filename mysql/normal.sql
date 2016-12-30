-- 创建用户,名字为userone,密码为123456
　　create user userone@localhost identified by '123456';
-- 创建名字为dbone的数据库
　　create database dbone;
-- 授予dbone数据库的所有权限给userone用户：
　　grant all on dbone.* to userone;