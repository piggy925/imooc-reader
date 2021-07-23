package com.mumu.reader.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;

@TableName("member_read_state")
public class MemberReadState {
    /**
     * 会员阅读状态
     */
    @TableId(type = IdType.AUTO)
    private Long rsId;

    /**
     * 图书编号
     */
    private Long bookId;

    /**
     * 会员编号
     */
    private Long memberId;

    /**
     * 阅读状态 1-想看 2-看过
     */
    private Integer readState;

    /**
     * 创建时间
     */
    private Date createTime;

    public Long getRsId() {
        return rsId;
    }

    public void setRsId(Long rsId) {
        this.rsId = rsId;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Integer getReadState() {
        return readState;
    }

    public void setReadState(Integer readState) {
        this.readState = readState;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}

