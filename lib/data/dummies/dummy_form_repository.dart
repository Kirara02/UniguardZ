import 'package:uniguard_z/data/repositories/form_repository.dart';
import 'package:uniguard_z/domain/entities/branch.dart';
import 'package:uniguard_z/domain/entities/result.dart';

class DummyFormRepository implements FormRepository {
  @override
  Future<Result<List<Branch>>> getForms() async {
    await Future.delayed(const Duration(seconds: 2));
    Map<String, dynamic> branch1 = {
      "CheckPoint": null,
      "FormBranches": [
        {"branchId": 6, "formId": null, "id": null, "status": 1},
        {"branchId": 125, "formId": null, "id": null, "status": 1},
        {"branchId": 151, "formId": null, "id": null, "status": 1},
        {"branchId": 152, "formId": null, "id": null, "status": 1},
        {"branchId": 348, "formId": null, "id": null, "status": 1},
        {"branchId": 490, "formId": null, "id": null, "status": 1}
      ],
      "FormFields": [
        {
          "FormPickList": {
            "FormPickListOptions": [
              {"id": 611, "name": "A", "status": 1},
              {"id": 612, "name": "B", "status": 1},
              {"id": 613, "name": "C", "status": 1},
              {"id": 614, "name": "D", "status": 1}
            ],
            "id": 67,
            "name": "ABC LIST ",
            "status": 1
          },
          "fieldTypeId": 6,
          "formId": 515,
          "id": 5646,
          "isRequire": false,
          "name": "ABC LIST ",
          "pickListId": 67,
          "status": 1
        },
        {
          "FormPickList": {
            "FormPickListOptions": [
              {"id": 1604, "name": "A", "status": 1},
              {"id": 1605, "name": "B", "status": 1},
              {"id": 1606, "name": "C", "status": 1}
            ],
            "id": 208,
            "name": "Test Duplication",
            "status": 1
          },
          "fieldTypeId": 6,
          "formId": 515,
          "id": 4983,
          "isRequire": true,
          "name": "Test Duplication",
          "pickListId": 208,
          "status": 1
        }
      ],
      "Role": null,
      "checkPointId": 0,
      "createdAt": "2021-11-21T22:34:46.000Z",
      "id": 515,
      "name": "A Test of Duplication",
      "parentBranchId": 6,
      "roleId": 0,
      "updatedAt": "2022-07-13T00:11:58.000Z"
    };

    Map<String, dynamic> branch2 = {
      "CheckPoint": {"name": "Office Kontakt"},
      "FormBranches": [
        {"branchId": 6, "formId": null, "id": null, "status": 1}
      ],
      "FormFields": [
        {
          "FormPickList": null,
          "fieldTypeId": 3,
          "formId": 550,
          "id": 5257,
          "isRequire": true,
          "name": "Did you check Gym Door was Locked",
          "pickListId": 0,
          "status": 1
        },
        {
          "FormPickList": null,
          "fieldTypeId": 3,
          "formId": 550,
          "id": 5258,
          "isRequire": true,
          "name": "Is there 2 rubber Mats",
          "pickListId": 0,
          "status": 1
        },
        {
          "FormPickList": null,
          "fieldTypeId": 4,
          "formId": 550,
          "id": 5259,
          "isRequire": true,
          "name": "Photo of Gym Equipment",
          "pickListId": 0,
          "status": 1
        }
      ],
      "Role": {"roleName": "Security Guard"},
      "checkPointId": 10895,
      "createdAt": "2022-02-25T05:20:47.000Z",
      "id": 550,
      "name": "Check Gym Equipment",
      "parentBranchId": 6,
      "roleId": 100,
      "updatedAt": "2022-02-25T05:20:47.000Z"
    };
    List<Branch> data = [
      Branch.fromJson(branch1),
      Branch.fromJson(branch2),
    ];

    return Result.success(data);
  }
}
