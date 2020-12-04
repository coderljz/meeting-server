package com.ljz.meetingserver.model.dao;

import com.ljz.meetingserver.model.pojo.MeetingMessage;

public interface MeetingMessageMapper {
    int deleteByPrimaryKey(Integer meetingMessageId);

    int insert(MeetingMessage record);

    int insertSelective(MeetingMessage record);

    MeetingMessage selectByPrimaryKey(Integer meetingMessageId);

    int updateByPrimaryKeySelective(MeetingMessage record);

    int updateByPrimaryKey(MeetingMessage record);
}