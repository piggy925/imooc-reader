package com.mumu.reader.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mumu.reader.entity.*;
import com.mumu.reader.service.BookService;
import com.mumu.reader.service.CategoryService;
import com.mumu.reader.service.EvaluationService;
import com.mumu.reader.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * The type Book controller.
 */
@Controller
public class BookController {
    @Resource
    private CategoryService categoryService;
    @Resource
    private BookService bookService;
    @Resource
    private EvaluationService evaluationService;
    @Resource
    private MemberService memberService;

    /**
     * 显示首页
     *
     * @return model and view
     */
    @GetMapping("/index")
    public ModelAndView showIndex() {
        ModelAndView mav = new ModelAndView("/index");
        List<Category> categoryList = categoryService.selectAll();
        mav.addObject("categoryList", categoryList);
        return mav;
    }

    /**
     * 分页查询图书对象
     *
     * @param p 页号
     * @return 分页对象
     */
    @ResponseBody
    @GetMapping("/books")
    public IPage<Book> selectBook(Long categoryId, String order, Integer p) {
        if (p == null) {
            p = 1;
        }
        IPage<Book> pageObject = bookService.paging(categoryId, order, p, 10);
        return pageObject;
    }

    @GetMapping("/book/{id}")
    public ModelAndView selectBookById(@PathVariable("id") Long bookId, HttpSession session) {
        ModelAndView mav = new ModelAndView("/detail");
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            MemberReadState memberReadState = memberService.getMemberReadState(loginUser.getMemberId(), bookId);
            mav.addObject("memberReadState", memberReadState);
        }
        Book book = bookService.selectById(bookId);
        mav.addObject("book", book);
        List<Evaluation> evaluationList = evaluationService.selectByBookId(bookId);
        mav.addObject("evaluationList", evaluationList);
        return mav;
    }
}