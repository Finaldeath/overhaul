int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oBaby = GetItemPossessedBy(oPC, "q1hbaby");
    if (GetLocalInt(GetModule(), "X1_Q1HBLAKEDEAD") == 1 && GetIsObjectValid(oBaby) == TRUE)
    {
        SetLocalObject(GetModule(), "X1Q1BBaby", oBaby);
        return TRUE;
    }
    return FALSE;
}


