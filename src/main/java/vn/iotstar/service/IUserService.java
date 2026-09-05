package vn.iotstar.service;

import vn.iotstar.entity.User;

public interface IUserService {

    User register(User user, String plainPassword) throws Exception;

    boolean verifyOtp(String email, String otpCode) throws Exception;

    boolean resendOtp(String email) throws Exception;

    User login(String usernameOrEmail, String password) throws Exception;

    boolean sendForgotPasswordOtp(String email) throws Exception;

    boolean resetPassword(String email, String otpCode, String newPassword) throws Exception;

    User findById(int id);

    User findByEmail(String email);

    User findByUsername(String username);

    void update(User user);
}
