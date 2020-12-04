package com.ljz.meetingserver.model.pojo;

import java.util.Date;

public class MeetingMessage {
    private Integer meetingMessageId;

    private Integer roomId;

    private Integer hostClerkId;

    private String title;

    private String content;

    private Date date;

    private String timeSlot;

    private String record;

    private String checkState;

    private String timeState;

    public Integer getMeetingMessageId() {
        return meetingMessageId;
    }

    public void setMeetingMessageId(Integer meetingMessageId) {
        this.meetingMessageId = meetingMessageId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getHostClerkId() {
        return hostClerkId;
    }

    public void setHostClerkId(Integer hostClerkId) {
        this.hostClerkId = hostClerkId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot == null ? null : timeSlot.trim();
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }

    public String getCheckState() {
        return checkState;
    }

    public void setCheckState(String checkState) {
        this.checkState = checkState == null ? null : checkState.trim();
    }

    public String getTimeState() {
        return timeState;
    }

    public void setTimeState(String timeState) {
        this.timeState = timeState == null ? null : timeState.trim();
    }
}