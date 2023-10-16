//::///////////////////////////////////////////////
//:: FileName christer_03
//:://////////////////////////////////////////////
/*
    Returns TRUE if Christer's "ChristerTalked"
    variable has not yet been set.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iChristerTalked = GetLocalInt(OBJECT_SELF, "ChristerTalked");

    if (iChristerTalked == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
