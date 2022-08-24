package com.weixin.boot.sample.dao;

import com.weixin.boot.sample.domain.Sample;

import java.util.List;
import java.util.Map;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:38
 */
public interface SampleDao {
    List<Sample> page(Map<String, Object> conditons);

    int insert(Sample sample);

    int update(Sample sample);

    int delete(long[] ids);

    Sample get(long id);
}
