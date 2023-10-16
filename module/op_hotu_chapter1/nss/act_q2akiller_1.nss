void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_PreAssassin", 1);
    SetLocalInt(OBJECT_SELF, "nTalkedToPC", 1);
}
