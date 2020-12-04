package com.ljz.meetingserver.model.pojo;

public class Join {
    private Integer joinId;

    private Integer meetingMessageId;

    private Integer clerkJoinId;

    public Integer getJoinId() {
        return joinId;
    }

    public void setJoinId(Integer joinId) {
        this.joinId = joinId;
    }

    public Integer getMeetingMessageId() {
        return meetingMessageId;
    }

    public void setMeetingMessageId(Integer meetingMessageId) {
        this.meetingMessageId = meetingMessageId;
    }

    public Integer getClerkJoinId() {
        return clerkJoinId;
    }

    public void setClerkJoinId(Integer clerkJoinId) {
        this.clerkJoinId = clerkJoinId;
    }
}