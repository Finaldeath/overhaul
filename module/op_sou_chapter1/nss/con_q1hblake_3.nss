int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBaby = GetItemPossessedBy(oPC, "q1hbaby");
    if (GetIsObjectValid(oBaby) == TRUE && GetLocalInt(OBJECT_SELF, "nBoughtSlave") != 1)
    {
        SetLocalObject(GetModule(), "X1Q1BBaby", oBaby);
        return TRUE;
    }
    return FALSE;
}
