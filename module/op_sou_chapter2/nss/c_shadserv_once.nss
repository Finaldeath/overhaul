//::///////////////////////////////////////////////
//:: Shadow Servant (Condition - 0 Times Talked To)
//:: C_ShadServ_Once.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Shadow Servant has not
     yet been spoken to.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 28, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTalkedTo = GetLocalInt(OBJECT_SELF, "bTalkedTo");

    if (bTalkedTo == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bTalkedTo", TRUE);
        return TRUE;
    }
    return FALSE;
}
