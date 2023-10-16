//::///////////////////////////////////////////////
//:: Name hx_slp_lovegood
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Good Aribeth is Sleeping Man's love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);

    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove ==  "Aribeth")
    {
        if (iAlignment == ALIGNMENT_GOOD)
        {
            return TRUE;
        }
    }
    return FALSE;
}
