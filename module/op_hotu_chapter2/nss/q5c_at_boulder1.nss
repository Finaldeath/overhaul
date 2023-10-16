void main()
{
    object oPC = GetPCSpeaker();
    object oHole = GetObjectByTag("q5b_hole");
    AssignCommand(oPC, JumpToObject(oHole));
}
