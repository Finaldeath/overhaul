void main()
{
    object oPC = GetPCSpeaker();
    string sPCName = GetName(oPC);

    SetLocalInt(OBJECT_SELF, sPCName, 1);
}
