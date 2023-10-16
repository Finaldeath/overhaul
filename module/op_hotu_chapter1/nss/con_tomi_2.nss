//::///////////////////////////////////////////////
//:: Name con_tomi_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if Tomi can see Linu return TRUE
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oLinu = GetObjectByTag("x2_hen_linu");

    if (GetObjectSeen(oLinu) == TRUE)
        return TRUE;
    return FALSE;


}
