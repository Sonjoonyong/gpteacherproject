package com.sooaz.gpt.global.handlers;

import com.sooaz.gpt.domain.learning.LearningType;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(LearningType.class)
public class LearningTypeHandler extends BaseTypeHandler<LearningType> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, LearningType learningType,
                                    JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, learningType.name());
    }

    @Override
    public LearningType getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return LearningType.valueOf(resultSet.getString(s));
    }

    @Override
    public LearningType getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return LearningType.valueOf(resultSet.getString(i));
    }

    @Override
    public LearningType getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return LearningType.valueOf(callableStatement.getString(i));
    }
}
