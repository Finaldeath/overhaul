int StartingConditional()
{
    string sTag = GetTag(OBJECT_SELF);

    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, sTag + "_INTERLUDE_PAST") == 0)
        return TRUE;

    return FALSE;
}
