//Halaster's face each other
void main()
{
    object oFake = OBJECT_SELF;
    object oReal = GetNearestObjectByTag("q2d_halas2");
    object oPC = GetPCSpeaker();
    AssignCommand(oReal, SetFacingPoint(GetPosition(oFake)));
    SetFacingPoint(GetPosition(oReal));
}
