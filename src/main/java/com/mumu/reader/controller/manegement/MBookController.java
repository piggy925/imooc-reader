package com.mumu.reader.controller.manegement;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mumu.reader.entity.Book;
import com.mumu.reader.service.BookService;
import com.mumu.reader.service.exception.BussinessException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/management/book")
public class MBookController {
    @Resource
    private BookService bookService;

    @GetMapping("/index.html")
    public ModelAndView showBook() {
        ModelAndView mav = new ModelAndView("/management/book");
        return mav;
    }

    @PostMapping("/upload")
    @ResponseBody
    public Map upload(@RequestParam("img") MultipartFile file, HttpServletRequest request) throws IOException {
        String uploadPath = request.getServletContext().getResource("/").getPath() + "/upload/";
        String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        file.transferTo(new File(uploadPath + fileName + suffix));
        Map result = new HashMap();
        result.put("errno", "0");
        result.put("data", new String[]{"/upload/" + fileName + suffix});
        return result;
    }

    @ResponseBody
    @PostMapping("/create")
    public Map create(Book book) {
        Map result = new HashMap();
        try {
            book.setEvaluationQuantity(0);
            book.setEvaluationScore(0F);
            Document doc = Jsoup.parse(book.getDescription());
            Element img = doc.select("img").first();
            String cover = img.attr("src");
            book.setCover(cover);
            bookService.create(book);

            result.put("code", "0");
            result.put("msg", "success");
        } catch (BussinessException e) {
            e.printStackTrace();
            result.put("code", e.getCode());
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @GetMapping("/list")
    public Map list(Integer page, Integer limit) {
        if (page == null) {
            page = 1;
        }
        if (limit == null) {
            limit = 10;
        }
        IPage<Book> pageObject = bookService.paging(null, null, page, limit);
        Map result = new HashMap();
        result.put("code", "0");
        result.put("msg", "success");
        result.put("data", pageObject.getRecords());
        result.put("count", pageObject.getTotal());
        return result;
    }

    @ResponseBody
    @GetMapping("/id/{id}")
    public Map selectById(@PathVariable("id") Long bookId) {
        Book book = bookService.selectById(bookId);
        Map result = new HashMap();
        result.put("code", "0");
        result.put("msg", "success");
        result.put("data", book);
        return result;
    }

    @ResponseBody
    @PostMapping("/update")
    public Map update(Book book) {
        Map result = new HashMap();
        try {
            bookService.update(book);
            result.put("code", "0");
            result.put("msg", "success");
        } catch (BussinessException e) {
            e.printStackTrace();
            result.put("code", e.getCode());
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @GetMapping("/delete/{id}")
    public Map delete(@PathVariable("id") Long bookId) {
        Map result = new HashMap();
        try {
            bookService.delete(bookId);
            result.put("code", "0");
            result.put("msg", "success");
        } catch (BussinessException e) {
            e.printStackTrace();
            result.put("code", e.getCode());
            result.put("msg", e.getMessage());
        }
        return result;
    }
}
