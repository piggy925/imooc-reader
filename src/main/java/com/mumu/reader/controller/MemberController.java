package com.mumu.reader.controller;

import com.mumu.reader.entity.Evaluation;
import com.mumu.reader.entity.Member;
import com.mumu.reader.service.MemberService;
import com.mumu.reader.service.exception.BussinessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MemberController {
    @Resource
    private MemberService memberService;

    @GetMapping("/register.html")
    public ModelAndView showRegister() {
        return new ModelAndView("/register");
    }

    @GetMapping("/login.html")
    public ModelAndView showLogin() {
        return new ModelAndView("/login");
    }

    @PostMapping("/check_login")
    @ResponseBody
    public Map checkLogin(String username, String password, String vc, HttpSession session) {
        String verifyCode = (String) session.getAttribute("kaptchaVerifyCode");
        Map result = new HashMap();
        if (vc == null || verifyCode == null || !vc.equalsIgnoreCase(verifyCode)) {
            result.put("code", "VC01");
            result.put("msg", " 验证码错误");
        } else {
            try {
                Member member = memberService.checkLogin(username, password);
                session.setAttribute("loginUser", member);
                result.put("code", "0");
                result.put("msg", " success");
            } catch (BussinessException e) {
                e.printStackTrace();
                result.put("code", e.getCode());
                result.put("msg", e.getMsg());
            }
        }
        return result;
    }

    @PostMapping("/register")
    @ResponseBody
    public Map register(String vc, String username, String password, String nickname, HttpServletRequest request) {
        String verifyCode = (String) request.getSession().getAttribute("kaptchaVerifyCode");
        Map result = new HashMap();
        if (vc == null || verifyCode == null || !vc.equalsIgnoreCase(verifyCode)) {
            result.put("code", "VC01");
            result.put("msg", " 验证码错误");
        } else {
            try {
                memberService.createMember(username, password, nickname);
                result.put("code", "0");
                result.put("msg", " success");
            } catch (BussinessException e) {
                e.printStackTrace();
                result.put("code", e.getCode());
                result.put("msg", e.getMessage());
            }
        }
        return result;
    }

    @PostMapping("/update_read_state")
    @ResponseBody
    public Map updateMemberReadState(Long memberId, Long bookId, Integer readState) {
        Map result = new HashMap();
        try {
            memberService.updateMemberReadState(memberId, bookId, readState);
            result.put("code", "0");
            result.put("msg", "success");
        } catch (BussinessException e) {
            e.printStackTrace();
            result.put("code", e.getCode());
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @PostMapping("/evaluate")
    @ResponseBody
    public Map evaluate(Long memberId, Long bookId, Integer score, String content) {
        Map result = new HashMap();
        try {
            memberService.evaluate(memberId, bookId, score, content);
            result.put("code", "0");
            result.put("msg", "success");
        } catch (BussinessException e) {
            e.printStackTrace();
            result.put("code", e.getCode());
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @PostMapping("/enjoy")
    @ResponseBody
    public Map evaluate(Long evaluationId) {
        Map result = new HashMap();
        try {
            Evaluation evaluation = memberService.enjoy(evaluationId);
            result.put("code", "0");
            result.put("msg", "success");
            result.put("evaluation", evaluation);
        } catch (BussinessException e) {
            e.printStackTrace();
            result.put("code", e.getCode());
            result.put("msg", e.getMessage());
        }
        return result;
    }
}
