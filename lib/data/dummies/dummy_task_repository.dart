import 'package:uniguard_z/data/repositories/task_repository.dart';
import 'package:uniguard_z/domain/entities/result.dart';
import 'package:uniguard_z/domain/entities/task.dart';

class DummyTaskRepository implements TaskRepository {
  @override
  Future<Result<List<Task>>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Map<String, dynamic> task1 = {
      "TaskAssign": {
        "CheckPoint": null,
        "Role": {"roleId": 274, "roleName": "Engineering"},
        "User": {"name": "Test2", "userId": 3985},
        "checkPointId": 0,
        "id": 679,
        "roleId": 274,
        "status": 1,
        "userId": 3985
      },
      "TaskFields": [
        {"fieldTypeId": 1, "id": 2829, "name": "what was completed", "status": 1},
        {"fieldTypeId": 4, "id": 2830, "name": "pic of completed task", "status": 1},
        {"fieldTypeId": 3, "id": 2611, "name": "Is the Toilet clean", "status": 1}
      ],
      "allowedTime": 0,
      "branchId": 6,
      "createdAt": "2021-11-01T23:26:48.000Z",
      "id": 679,
      "name": "Example task",
      "occurance": 1,
      "startDateTime": "2024-05-31T00:00:00.000Z",
      "updatedAt": "2024-05-31T05:19:19.000Z",
      "validDateTime": "2024-05-31T23:59:00.000Z"
    };
    Map<String, dynamic> task2 = {
      "TaskAssign": {
        "CheckPoint": null,
        "Role": {"roleId": 95, "roleName": "Cleaner"},
        "User": null,
        "checkPointId": 0,
        "id": 46,
        "roleId": 95,
        "status": 1,
        "userId": 0
      },
      "TaskFields": [
        {"fieldTypeId": 3, "id": 190, "name": "Mop Floors", "status": 1},
        {"fieldTypeId": 3, "id": 187, "name": "Check Soap Dispensers", "status": 1},
        {"fieldTypeId": 1, "id": 191, "name": "Comments", "status": 1},
        {"fieldTypeId": 3, "id": 188, "name": "Check Paper Levels", "status": 1},
        {"fieldTypeId": 3, "id": 189, "name": "Clean Mirrors", "status": 1}
      ],
      "allowedTime": 10,
      "branchId": 6,
      "createdAt": "2019-09-30T23:32:29.000Z",
      "id": 46,
      "name": "Bathroom Check",
      "occurance": 1,
      "startDateTime": "2020-02-22T17:45:00.000Z",
      "updatedAt": "2022-02-24T04:19:53.000Z",
      "validDateTime": "2020-11-30T14:00:00.000Z"
    };

    List<Task> tasks = [
      Task.fromJson(task1),
      Task.fromJson(task2),
    ];

    return Result.success(tasks);
  }
}
