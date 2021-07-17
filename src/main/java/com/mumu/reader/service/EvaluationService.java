package com.mumu.reader.service;

import com.mumu.reader.entity.Evaluation;

import java.util.List;


/**
 * The interface Evaluation service.
 */
public interface EvaluationService {
    /**
     * 按图书编号查询有效短评
     *
     * @param bookId 图书编号
     * @return 评论列表
     */
    List<Evaluation> selectByBookId(Long bookId);
}
