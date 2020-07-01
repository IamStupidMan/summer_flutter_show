import 'package:redux/redux.dart';
import 'package:summerfluttershow/model/user.dart';

/**
 * 用户相关Redux
 */

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User>([
//  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);
