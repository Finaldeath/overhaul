void main()
{
    object oPC = GetPCSpeaker();
    object oHorns = GetLocalObject(OBJECT_SELF, "oHornsToDestroy");
    DestroyObject(oHorns);
    SetLocalInt(oPC, "X1_nSmithHelmWait", 1);
}
