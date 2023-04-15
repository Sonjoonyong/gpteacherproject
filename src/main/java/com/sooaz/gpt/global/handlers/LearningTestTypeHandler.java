package com.sooaz.gpt.global.handlers;

import com.sooaz.gpt.domain.learning.writing.LearningTestType;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(LearningTestType.class)
public class LearningTestTypeHandler extends BaseTypeHandler<LearningTestType> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, LearningTestType LearningTestType,
                                    JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, LearningTestType.name());
    }

    @Override
    public LearningTestType getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return LearningTestType.valueOf(resultSet.getString(s));
    }

    @Override
    public LearningTestType getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return LearningTestType.valueOf(resultSet.getString(i));
    }

    @Override
    public LearningTestType getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return LearningTestType.valueOf(callableStatement.getString(i));
    }
}
