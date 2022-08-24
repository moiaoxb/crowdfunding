package com.weixin.boot.sample.service;

import com.weixin.boot.sample.dao.SampleDao;
import com.weixin.boot.sample.domain.Sample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:47
 */
@Service
public class SampleServiceImpl implements SampleService {

    @Autowired
    private SampleDao dao;

    @Override
    public int save(Sample sample) {
        return dao.insert(sample);
    }

    @Override
    public int delete(long[] ids) {
        return dao.delete(ids);
    }

    @Override
    public int update(Sample sample) {
        return dao.update(sample);
    }

    @Override
    public Sample get(long ids) {
        return dao.get(ids);
    }

    @Override
    public List<Sample> search(Map<String, Object> conditions) {
        return dao.page(conditions);
    }
}
