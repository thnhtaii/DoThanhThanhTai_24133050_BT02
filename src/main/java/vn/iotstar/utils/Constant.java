package vn.iotstar.utils;

public class Constant {
    public static final String DIR = "c:\\Users\\dotai\\Documents\\workspace-spring-tools-for-eclipse-5.3.0.RELEASE\\JPA\\uploads";
    public static final int PAGE_SIZE = 6;
    public static final int TOP_RECENT_SIZE = 10;
    public static final int OTP_EXPIRY_MINUTES = 5;

    // Email SMTP Configuration
    public static final String EMAIL_HOST = "smtp.gmail.com";
    public static final String EMAIL_PORT = "587";
    public static final String EMAIL_FROM = System.getProperty("APP_EMAIL_FROM", "dothanhthanhtai24133050@gmail.com");
    public static final String EMAIL_PASSWORD = System.getProperty("APP_EMAIL_PASSWORD", "");
}
