import 'package:flutter/material.dart';
import 'package:mess_management_web/colors.dart';
import 'package:mess_management_web/core/models/worker_role.dart';
import 'package:mess_management_web/core/viewmodels/workerrole_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:mess_management_web/ui/app_button.dart';
import 'package:provider/provider.dart';

class ManageWorkerRole extends StatefulWidget {
  @override
  _ManageWorkerRoleState createState() => _ManageWorkerRoleState();
}

class _ManageWorkerRoleState extends State<ManageWorkerRole> {
  bool showAddCard = false;

  void setFalseCallback() {
    setState(() {
      showAddCard = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkerRoleModel>(
      builder: (_, model, __) {
        var list = model.roles != null
            ? List.generate(
                model.roles.length,
                (index) => WorkerRoleCard(
                  role: model.roles.elementAt(index),
                ),
              )
            : <Widget>[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  "Worker Role",
                  style: b90_20_600,
                ),
              ),
              Container(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      children: list,
                    ),
                    if (showAddCard)
                      WorkerRoleAddCard(callback: setFalseCallback),
                    IconButton(
                      iconSize: 48,
                      icon: Icon(
                        Icons.add_box,
                        size: 48,
                        color: appOrange,
                      ),
                      onPressed: () {
                        setState(() {
                          showAddCard = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class WorkerRoleAddCard extends StatelessWidget {
  final callback;

  const WorkerRoleAddCard({Key key, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WorkerRoleModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: cardDecorationDeepShadow,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DynamicEditFieldAdd(
              name: "WorkerRole",
              val: model.role.workerRole.toString(),
              onEdit: (value) {
                model.role = model.role..workerRole = value;
              },
            ),
            DynamicEditFieldAdd(
              name: "Salary",
              val: model.role.salary.toString(),
              onEdit: (value) {
                model.role = model.role..salary = double.parse(value);
              },
            ),
            DynamicEditFieldAdd(
              name: "Shift Start",
              val: model.role.shiftStart,
              onEdit: (value) {
                model.role = model.role..shiftStart = value;
              },
            ),
            DynamicEditFieldAdd(
              name: "Shift End",
              val: model.role.shiftEnd,
              onEdit: (value) {
                model.role = model.role..shiftEnd = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: "ADD",
                onPressed: () {
                  model.addWorkerRole(model.role);
                  callback();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerRoleCard extends StatelessWidget {
  final WorkerRole role;

  const WorkerRoleCard({Key key, this.role}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WorkerRoleModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 230,
        padding: EdgeInsets.all(16.0),
        decoration: cardDecorationDeepShadow,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  role.workerRole,
                  style: appBlack_16_600,
                ),
                IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    model.delWorkerRole(role);
                  },
                ),
              ],
            ),
            DynamicEditField(
              name: "Salary",
              val: role.salary.toString(),
              onEdit: (value) {
                model.updateWorkerRole(role..salary = double.parse(value));
              },
            ),
            DynamicEditField(
              name: "Shift Start",
              val: role.shiftStart,
              onEdit: (value) {
                model.updateWorkerRole(role..shiftStart = value);
              },
            ),
            DynamicEditField(
              name: "Shift End",
              val: role.shiftEnd,
              onEdit: (value) {
                model.updateWorkerRole(role..shiftEnd = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicEditFieldAdd extends StatefulWidget {
  final String name;
  final String val;
  final void Function(String val) onEdit;
  const DynamicEditFieldAdd({Key key, this.name, this.val, this.onEdit})
      : super(key: key);
  @override
  _DynamicEditFieldAddState createState() => _DynamicEditFieldAddState();
}

class _DynamicEditFieldAddState extends State<DynamicEditFieldAdd> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text(widget.name, style: b60_14)),
          Container(
            width: 120,
            child: TextField(
              onChanged: widget.onEdit,
              controller: controller,
              decoration: InputDecoration(
                hintText: widget.name,
                hintStyle: b60_14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicEditField extends StatefulWidget {
  final String name;
  final String val;
  final void Function(String val) onEdit;
  const DynamicEditField({Key key, this.name, this.val, this.onEdit})
      : super(key: key);
  @override
  _DynamicEditFieldState createState() => _DynamicEditFieldState();
}

class _DynamicEditFieldState extends State<DynamicEditField> {
  bool isEditing = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: !isEditing
            ? <Widget>[
                Expanded(child: Text(widget.name, style: b60_14)),
                Text(widget.val, style: b90_14),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                ),
              ]
            : <Widget>[
                Container(
                  width: 150,
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: widget.name,
                      hintStyle: b60_14,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.check_circle),
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                      widget.onEdit(controller.text);
                    });
                  },
                ),
              ],
      ),
    );
  }
}
