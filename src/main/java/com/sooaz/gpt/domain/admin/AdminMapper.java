package com.sooaz.gpt.domain.admin;

import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import com.sooaz.gpt.domain.admin.user.UserView;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
    List<MonthlyUserCount> getMonthlyUserCounts();
    List<AgeGroupCount> getAgeGroupCounts();
    List<UserView> getUserViewList(Map<String, Object> params);
    void blockUser(int userId);

}

