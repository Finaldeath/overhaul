//::///////////////////////////////////////////////
//:: Con_Feran_House.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if the player has purchased the
     Haunted House. Wrap in a DoOnce to avoid
     repetition.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iHouse = GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD");
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bMentionedHouse");
    if (iHouse >= 20 &&
        bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bMentionedHouse", TRUE);
        return TRUE;
    }
    return FALSE;
}
