package com.sooaz.gpt.domain.admin.trend;

import lombok.Data;

@Data
public class MonthlyUserCount {
    private int year;
    private int month;
    private long count;
}
