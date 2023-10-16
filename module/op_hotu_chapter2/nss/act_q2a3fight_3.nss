//Face towards the good guards
void main()
{
    object oEvil1 = GetObjectByTag("q2a3evilguard1");
    object oEvil2 = GetObjectByTag("q2a3evilguard2");
    object oEvil3 = GetObjectByTag("q2a3evilguard3");
    object oGood1 = GetObjectByTag("q2a3guard1");
    AssignCommand(oEvil1, SetFacingPoint(GetPosition(oGood1)));
    AssignCommand(oEvil2, SetFacingPoint(GetPosition(oGood1)));
    AssignCommand(oEvil2, SetFacingPoint(GetPosition(oGood1)));

}
