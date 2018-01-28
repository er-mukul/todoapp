package com.igt.apps.todo.enums;

public enum TaskStatus {
    PENDING("Pending State"),
    COMPLETED("Completed");

    private String displayText;
    TaskStatus(String displayText){
        this.displayText = displayText;
    }

    public String getDisplayText(){
        return displayText;
    }
}
