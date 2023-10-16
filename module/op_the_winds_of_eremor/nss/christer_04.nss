//::///////////////////////////////////////////////
//:: FileName christer_03
//:://////////////////////////////////////////////
/*
    Returns TRUE if Christer's "ChristerTalked"
    variable has already been set.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iChristerTalked = GetLocalInt(OBJECT_SELF, "ChristerTalked");

    if (iChristerTalked == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

