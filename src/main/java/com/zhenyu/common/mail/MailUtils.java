package com.zhenyu.common.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮箱工具
 * @author lizhenyu
 *
 */
public class MailUtils {



    public static void sendEmail(String code,String useremail) throws MessagingException {
        Properties properties = new Properties();
        //开启debug调试
        properties.setProperty("mail.debug", "true");

        //发送服务器需要身份认证
        properties.setProperty("mail.smtp.auth", "true");

        //设置服务器主机
        properties.setProperty("mail.host", "smtp.163.com");

        // 发送邮件协议名称
        properties.setProperty("mail.transport.protocol", "smtp");
        MyAuthenticator myauth = new MyAuthenticator("m17714389130@163.com", "5201314...=====");
        // 设置环境信息
        Session session = Session.getInstance(properties, myauth);

        // 创建邮件对象
        Message msg = new MimeMessage(session);
        msg.setSubject("站点注册验证码");
        // 设置邮件内容
        msg.setText("您的激活码是:"+code);
        // 设置发件人
        msg.setFrom(new InternetAddress("m17714389130@163.com"));
        msg.addRecipient(Message.RecipientType.TO,
                new InternetAddress(useremail));//2546977800@qq.com
        //Transport transport = session.getTransport();
        // 连接邮件服务器cyvv wdmq rkxd bhjj
        //transport.connect("136505403", "5201314...=====");
        // 发送邮件
        //transport.sendMessage(msg, new Address[] {new InternetAddress("136505403@qq.com")});
        // 关闭连接
        //transport.close();
        Transport.send(msg);
    }



}
class MyAuthenticator
        extends javax.mail.Authenticator {
    private String strUser;
    private String strPwd;
    public MyAuthenticator(String user, String password) {
        this.strUser = user;
        this.strPwd = password;
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(strUser, strPwd);
    }
}