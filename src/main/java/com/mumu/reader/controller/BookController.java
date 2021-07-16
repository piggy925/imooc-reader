package com.mumu.reader.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mumu.reader.entity.Book;
import com.mumu.reader.entity.Category;
import com.mumu.reader.service.BookService;
import com.mumu.reader.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
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
}
