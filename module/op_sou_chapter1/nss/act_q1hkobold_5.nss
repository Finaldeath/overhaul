//Kobold will back off the PC a touch..
void main()
{
    object oPC = GetPCSpeaker();
    object oDialog = GetObjectByTag("q1hdialog");
    object oKobold = GetObjectByTag("q1h2_kblake");
    AssignCommand(oKobold, ActionMoveToObject(oDialog));
    DelayCommand(3.0, AssignCommand(oKobold, SetFacingPoint(GetPosition(oPC))));
}
