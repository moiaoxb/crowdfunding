package com.weixin.boot.sample.service;

import com.weixin.boot.sample.domain.Sample;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:38
 */
public interface SampleService {
    int save(Sample sample);

    int delete(long[] ids);

    int update(Sample sample);

    /**
     * 按照ID查询一条记录
     * @param ids
     * @return
     */
    Sample get(long ids);

    /**
     * 按条件查询
     *
     * @param conditions，name、pageNum、pageSize
     * @return
     */
    List<Sample> search(Map<String, Object> conditions);
}
