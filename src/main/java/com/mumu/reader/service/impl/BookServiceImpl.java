package com.mumu.reader.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mumu.reader.entity.Book;
import com.mumu.reader.mapper.BookMapper;
import com.mumu.reader.service.BookService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("bookService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class BookServiceImpl implements BookService {
    @Resource
    private BookMapper bookMapper;

    /**
     * 分页查询图书
     *
     * @param page 页号
     * @param rows 每页记录数
     * @return 分页对象
     */
    @Override
    public IPage<Book> paging(Integer page, Integer rows) {
        Page<Book> bookPage = new Page<>(page, rows);
        IPage<Book> bookObject = bookMapper.selectPage(bookPage, new QueryWrapper<>());
        return bookObject;
    }
}