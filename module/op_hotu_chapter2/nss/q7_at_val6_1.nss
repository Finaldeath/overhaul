// guards turn towards to pc copy

void main()
{
    object oGuard1 = GetObjectByTag("q7_guard1");
    object oGuard2 = GetObjectByTag("q7_guard2");
    object oGuard3 = GetObjectByTag("q7_guard3");
    object oGuard4 = GetObjectByTag("q7_guard4");
    object oGuard5 = GetObjectByTag("q7_guard5");
    object oGuard6 = GetObjectByTag("q7_guard6");
    object oGuard7 = GetObjectByTag("q7_guard7");

    object oCopy = GetObjectByTag("q7b2_pc_copy");
    DelayCommand(0.1, AssignCommand(oGuard1, SetFacingPoint(GetPosition(oCopy))));
    DelayCommand(0.3, AssignCommand(oGuard2, SetFacingPoint(GetPosition(oCopy))));
    DelayCommand(0.6, AssignCommand(oGuard3, SetFacingPoint(GetPosition(oCopy))));
    DelayCommand(0.9, AssignCommand(oGuard4, SetFacingPoint(GetPosition(oCopy))));
    DelayCommand(1.1, AssignCommand(oGuard5, SetFacingPoint(GetPosition(oCopy))));
    DelayCommand(1.1, AssignCommand(oGuard6, SetFacingPoint(GetPosition(oCopy))));
    DelayCommand(1.1, AssignCommand(oGuard7, SetFacingPoint(GetPosition(oCopy))));
}
