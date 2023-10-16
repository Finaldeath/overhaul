//Halasters both face the PC
void main()
{
    object oFake = OBJECT_SELF;
    object oReal = GetNearestObjectByTag("q2d_halas2");
    object oPC = GetPCSpeaker();
    AssignCommand(oReal, SetFacingPoint(GetPosition(oPC)));
    SetFacingPoint(GetPosition(oPC));
}
