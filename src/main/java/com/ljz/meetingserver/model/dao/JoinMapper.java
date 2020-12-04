package com.ljz.meetingserver.model.dao;

import com.ljz.meetingserver.model.pojo.Join;

public interface JoinMapper {
    int deleteByPrimaryKey(Integer joinId);

    int insert(Join record);

    int insertSelective(Join record);

    Join selectByPrimaryKey(Integer joinId);

    int updateByPrimaryKeySelective(Join record);

    int updateByPrimaryKey(Join record);
}