//Commoner 1 faces piper
void main()
{
    object oPiper = GetObjectByTag("q1gpiper");
    object oCommoner = GetObjectByTag("q1g_pip_common1");
    AssignCommand(oCommoner, SetFacingPoint(GetPosition(oPiper)));
}
