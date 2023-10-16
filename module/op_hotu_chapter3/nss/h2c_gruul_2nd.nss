//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, 1st Time Talked To (Condition Script)
//:: H2c_Gruul_2nd.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has hit this node
     before. Note that a separate "bTalked"
     variable is being stored on this character.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTalked = GetLocalInt(OBJECT_SELF, "bPre-QuestTalked");

    if (bTalked == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

