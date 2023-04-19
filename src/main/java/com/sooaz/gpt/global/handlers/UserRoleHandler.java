package com.sooaz.gpt.global.handlers;

import com.sooaz.gpt.domain.user.UserRole;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(UserRole.class)
public class UserRoleHandler extends BaseTypeHandler<UserRole> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, UserRole UserRole,
                                    JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, UserRole.name());
    }

    @Override
    public UserRole getNullableResult(ResultSet resultSet, String s) throws SQLException {
        if (resultSet.getString(s) == null) {
            return null;
        }
        return UserRole.valueOf(resultSet.getString(s));
    }

    @Override
    public UserRole getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return UserRole.valueOf(resultSet.getString(i));
    }

    @Override
    public UserRole getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return UserRole.valueOf(callableStatement.getString(i));
    }
}
