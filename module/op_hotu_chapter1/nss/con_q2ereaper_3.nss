//::///////////////////////////////////////////////
//:: Name : con_q2ereaper_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see that this is the hero PC talking
    and that there are more than one person in the party
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 17/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "nPCNumber") == 1)
    {
        int nCount = 0;
        object oPC = GetFirstFactionMember(GetPCSpeaker(), TRUE);
        while (oPC != OBJECT_INVALID || nCount < 2)
        {

            nCount = nCount + 1;
            oPC = GetNextFactionMember(GetPCSpeaker(), TRUE);
        }
        if (nCount > 1)
            return TRUE;
        return FALSE;
    }
    return FALSE;
}
