package com.ljz.meetingserver.model.pojo;

public class Room {
    private Integer roomId;

    private String roomAddress;

    private String isAvailable;

    private Integer appointNum;

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getRoomAddress() {
        return roomAddress;
    }

    public void setRoomAddress(String roomAddress) {
        this.roomAddress = roomAddress == null ? null : roomAddress.trim();
    }

    public String getIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(String isAvailable) {
        this.isAvailable = isAvailable == null ? null : isAvailable.trim();
    }

    public Integer getAppointNum() {
        return appointNum;
    }

    public void setAppointNum(Integer appointNum) {
        this.appointNum = appointNum;
    }
}