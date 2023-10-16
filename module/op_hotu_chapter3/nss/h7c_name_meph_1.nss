//::///////////////////////////////////////////////
//:: The Knower of Names, Mephistopheles Not Yet Named (Condition Script)
//:: H7c_Name_Meph_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has not yet
     learned Mephistopheles' True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTrueName = GetLocalInt(GetModule(), "bKnower_MephistophelesNamed");
    if (bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

