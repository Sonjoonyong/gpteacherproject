package com.sooaz.gpt.domain.admin;

import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;

import java.util.List;

public interface AdminMapper {
    List<MonthlyUserCount> getMonthlyUserCounts();
    List<AgeGroupCount> getAgeGroupCounts();
}

