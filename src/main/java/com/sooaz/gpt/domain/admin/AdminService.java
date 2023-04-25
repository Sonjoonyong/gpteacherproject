package com.sooaz.gpt.domain.admin;

import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import com.sooaz.gpt.domain.admin.user.UserView;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdminService {
    private final AdminMapper adminMapper;

    public List<MonthlyUserCount> getMonthlyUserCounts() {
        return adminMapper.getMonthlyUserCounts();
    }

    public List<AgeGroupCount> getAgeGroupCounts() {
        return adminMapper.getAgeGroupCounts();
    }

    public List<UserView> getUserViewList(String search, String searchOption) {
        Map<String, Object> params = new HashMap<>();
        params.put("search", search);
        params.put("searchOption", searchOption);
        return adminMapper.getUserViewList(params);
    }
}