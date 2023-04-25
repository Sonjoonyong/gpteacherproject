package com.sooaz.gpt.domain.admin;

import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import com.sooaz.gpt.domain.admin.user.UserView;

import java.util.List;

public interface AdminMapper {
    List<MonthlyUserCount> getMonthlyUserCounts();
    List<AgeGroupCount> getAgeGroupCounts();
    List<UserView> getUserViewList(String search);
}

