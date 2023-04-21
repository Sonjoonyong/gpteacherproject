package com.sooaz.gpt.domain.admin;

import com.sooaz.gpt.domain.admin.trend.AgeGroupCount;
import com.sooaz.gpt.domain.admin.trend.MonthlyUserCount;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
}