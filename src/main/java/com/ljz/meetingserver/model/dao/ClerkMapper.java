package com.ljz.meetingserver.model.dao;

import com.ljz.meetingserver.model.pojo.Clerk;

public interface ClerkMapper {
    int deleteByPrimaryKey(Integer clerkId);

    int insert(Clerk record);

    int insertSelective(Clerk record);

    Clerk selectByPrimaryKey(Integer clerkId);

    int updateByPrimaryKeySelective(Clerk record);

    int updateByPrimaryKey(Clerk record);
}