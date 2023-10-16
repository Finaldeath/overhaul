//::///////////////////////////////////////////////
//:: Name hx_slp_sen_true
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sensei's True name is known and she is a
     henchman.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iName = GetLocalInt(GetModule(), "bKnower_SenseiNamed");

    if(iName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
