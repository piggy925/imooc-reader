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

    Book selectById(Long bookId);

    /**
     * 更新图书评分与评论数量
     */
    void updateEvaluation();

    /**
     * 新增图书
     *
     * @param book 图书对象
     * @return 图书对象
     */
    Book create(Book book);

    /**
     * 更新图书信息.
     *
     * @param book 图书对象
     * @return 图书对象
     */
    Book update(Book book);

    /**
     * 删除图书.
     *
     * @param bookId 图书id
     */
    void delete(Long bookId);
}
