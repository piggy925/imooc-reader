package com.mumu.reader.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mumu.reader.entity.Book;

public interface BookMapper extends BaseMapper<Book> {
    void updateEvaluation();
}
