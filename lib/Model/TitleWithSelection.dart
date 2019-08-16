
class TitleWithSelectionInterface {
  bool isSelected;
  String title;
  int employeeId;
  onSelection(){}
}

class TitleWithSelection implements TitleWithSelectionInterface {

  @override
  bool isSelected;
  @override
  String title;
  @override
  int employeeId;

  TitleWithSelection(this.isSelected, this.title, this.employeeId);

  @override
  onSelection() {
    this.isSelected = !this.isSelected;
  }

}