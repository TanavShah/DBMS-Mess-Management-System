import 'package:flutter/material.dart';
import 'package:mess_management_web/core/models/worker_role.dart';
import 'package:mess_management_web/core/viewmodels/workerrole_model.dart';
import 'package:mess_management_web/styles.dart';
import 'package:provider/provider.dart';

class ManageWorkerRole extends StatelessWidget {
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
        return Container(
          child: Row(
            children: [
              Row(
                children: list,
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class WorkerRoleCard extends StatelessWidget {
  final WorkerRole role;

  const WorkerRoleCard({Key key, this.role}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WorkerRoleModel>(context, listen: false);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                role.workerRole,
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
                  icon: Icon(Icons.edit),
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
