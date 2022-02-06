package com.zhuhodor.server.common.domain;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 分页结果封装类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageBean<T> {
    //当前页码
    private Long pageNum;
    //每页总条数
    private Long pageSize;
    //总页数
    private Long totalPage;
    //结果总条数
    private Long total;
    //返回结果
    private List<T> list;


    /**
     * 将MyBatis Plus 分页结果转化为通用结果
     * @param pageResult
     */
    public static <T> PageBean<T> restPage(Page<T> pageResult) {
        PageBean<T> result = new PageBean<>();
        result.setTotal(pageResult.getTotal());
        result.setPageNum(pageResult.getCurrent());
        result.setPageSize(pageResult.getSize());
        result.setTotalPage(pageResult.getPages());
//        result.setTotalPage(pageResult.getTotal() % pageResult.getSize() == 0?
//                pageResult.getTotal() / pageResult.getSize() : (pageResult.getTotal() / pageResult.getSize()) + 1);
        result.setList((List<T>) pageResult.getRecords());
        return result;
    }
}
