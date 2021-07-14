package com.mumu.reader.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mumu.reader.entity.Test;

public interface TestMapper extends BaseMapper<Test> {
    public void insertSample();
}
