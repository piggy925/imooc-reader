package com.mumu.reader.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mumu.reader.entity.Book;
import com.mumu.reader.entity.Evaluation;
import com.mumu.reader.entity.MemberReadState;
import com.mumu.reader.mapper.BookMapper;
import com.mumu.reader.mapper.EvaluationMapper;
import com.mumu.reader.mapper.MemberReadStateMapper;
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
    @Resource
    private MemberReadStateMapper memberReadStateMapper;
    @Resource
    private EvaluationMapper evaluationMapper;

    /**
     * 分页查询图书
     *
     * @param page 页号
     * @param rows 每页记录数
     * @return 分页对象
     */
    @Override
    public IPage<Book> paging(Long categoryId, String order, Integer page, Integer rows) {
        Page<Book> bookPage = new Page<>(page, rows);
        QueryWrapper<Book> queryWrapper = new QueryWrapper<>();
        if (categoryId != null && categoryId != -1) {
            queryWrapper.eq("category_id", categoryId);
        }
        if (order != null) {
            if (order.equals("quantity")) {
                queryWrapper.orderByDesc("evaluation_quantity");
            } else if (order.equals("score")) {
                queryWrapper.orderByDesc("evaluation_score");
            }
        }
        IPage<Book> bookObject = bookMapper.selectPage(bookPage, queryWrapper);
        return bookObject;
    }

    @Override
    public Book selectById(Long bookId) {
        Book book = bookMapper.selectById(bookId);
        return book;
    }

    @Override
    @Transactional()
    public void updateEvaluation() {
        bookMapper.updateEvaluation();
    }

    @Override
    @Transactional
    public Book create(Book book) {
        bookMapper.insert(book);
        return book;
    }

    @Override
    public Book update(Book book) {
        bookMapper.updateById(book);
        return book;
    }

    @Override
    @Transactional
    public void delete(Long bookId) {
        bookMapper.deleteById(bookId);
        QueryWrapper<Evaluation> evaluationQueryWrapper = new QueryWrapper<>();
        evaluationQueryWrapper.eq("book_id", bookId);
        evaluationMapper.delete(evaluationQueryWrapper);
        QueryWrapper<MemberReadState> memberReadStateQueryWrapper = new QueryWrapper<>();
        memberReadStateQueryWrapper.eq("book_id", bookId);
        memberReadStateMapper.delete(memberReadStateQueryWrapper);
    }
}
