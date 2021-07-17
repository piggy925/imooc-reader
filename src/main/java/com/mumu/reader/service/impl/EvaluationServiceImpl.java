package com.mumu.reader.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mumu.reader.entity.Evaluation;
import com.mumu.reader.entity.Member;
import com.mumu.reader.mapper.EvaluationMapper;
import com.mumu.reader.mapper.MemberMapper;
import com.mumu.reader.service.EvaluationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("evaluationService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class EvaluationServiceImpl implements EvaluationService {
    @Resource
    private EvaluationMapper evaluationMapper;
    @Resource
    private MemberMapper memberMapper;

    @Override
    public List<Evaluation> selectByBookId(Long bookId) {
        QueryWrapper<Evaluation> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("book_id", bookId);
        queryWrapper.eq("state", "enable");
        queryWrapper.orderByDesc("create_time");

        List<Evaluation> evaluationList = evaluationMapper.selectList(queryWrapper);
        for (Evaluation evaluation : evaluationList) {
            Member member = memberMapper.selectById(evaluation.getMemberId());
            evaluation.setMember(member);
        }
        return evaluationList;
    }
}
