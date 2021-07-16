package com.mumu.reader.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mumu.reader.entity.Book;


/**
 * The interface Book service.
 */
public interface BookService {
    /**
     * 分页查询图书
     *
     * @param page 页号
     * @param rows 每页记录数
     * @return 分页对象
     */
    IPage<Book> paging(Long categoryId, String order, Integer page, Integer rows);
}
