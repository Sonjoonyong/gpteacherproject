package com.sooaz.gpt.domain.admin;

import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import com.sooaz.gpt.domain.admin.user.UserView;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminRepository {
    private final AdminMapper adminMapper;

    public List<MonthlyUserCount> getMonthlyUserCounts() {
        return adminMapper.getMonthlyUserCounts();
    }

    public List<AgeGroupCount> getAgeGroupCounts() {
        return adminMapper.getAgeGroupCounts();
    }

    public List<UserView> getUserViewList(String search) {
        return adminMapper.getUserViewList(search);
    }

}