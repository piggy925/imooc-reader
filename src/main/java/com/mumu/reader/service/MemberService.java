package com.mumu.reader.service;

import com.mumu.reader.entity.Evaluation;
import com.mumu.reader.entity.Member;
import com.mumu.reader.entity.MemberReadState;

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
     * @return 会员对象 member
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

    /**
     * 获取图书阅读状态.
     *
     * @param memberId 会员id
     * @param bookId   图书id
     * @return 阅读状态对象
     */
    MemberReadState getMemberReadState(Long memberId, Long bookId);

    /**
     * 更新书籍阅读状态
     *
     * @param memberId 会员id
     * @param bookId   图书id
     * @param readState    阅读状态
     * @return 阅读状态对象
     */
    MemberReadState updateMemberReadState(Long memberId, Long bookId, Integer readState);

    /**
     * 评价图书
     *
     * @param memberId 会员id
     * @param bookId   图书id
     * @param score    评分
     * @param content  评价内容
     * @return 评价对象
     */
    Evaluation evaluate(Long memberId, Long bookId, Integer score, String content);
}
