package com.mumu.reader.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mumu.reader.entity.Member;
import com.mumu.reader.mapper.MemberMapper;
import com.mumu.reader.service.MemberService;
import com.mumu.reader.service.exception.BussinessException;
import com.mumu.reader.utils.MD5Utils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service("memberService")
@Transactional
public class MemberServiceImpl implements MemberService {
    @Resource
    private MemberMapper memberMapper;

    @Override
    public Member createMember(String username, String password, String nickname) {
        QueryWrapper<Member> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        List<Member> memberList = memberMapper.selectList(queryWrapper);
        //判断用户名是否已存在
        if (memberList.size() > 0) {
            throw new BussinessException("M01", "用户名已存在");
        }
        Member member = new Member();
        member.setUsername(username);
        member.setNickname(nickname);
        //保证盐值有4位数
        int salt = new Random().nextInt(1000) + 1000;
        String md5Password = MD5Utils.MD5Digest(password, salt);
        member.setPassword(md5Password);
        member.setSalt(salt);
        member.setCreateTime(new Date());
        memberMapper.insert(member);
        return member;
    }

    @Override
    public Member checkLogin(String username, String password) {
        QueryWrapper<Member> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        Member member = memberMapper.selectOne(queryWrapper);
        if (member == null) {
            throw new BussinessException("M02", "用户不存在");
        }
        String md5Password = MD5Utils.MD5Digest(password, member.getSalt());
        if (md5Password.equals(password)) {
            throw new BussinessException("M03", "密码错误");
        }
        return member;
    }
}
