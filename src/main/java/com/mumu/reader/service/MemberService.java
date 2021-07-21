package com.mumu.reader.service;

import com.mumu.reader.entity.Member;

/**
 * The interface Member service.
 */
public interface MemberService {
    /**
     * 创建新会员.
     *
     * @param username 用户名
     * @param password 密码
     * @param nickname 昵称
     * @return 会员对象
     */
    Member createMember(String username, String password, String nickname);

    /**
     * 登录校验
     *
     * @param username 用户名
     * @param password 密码
     * @return 登录对象
     */
    Member checkLogin(String username, String password);
}
