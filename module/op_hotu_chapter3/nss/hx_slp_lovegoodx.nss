//::///////////////////////////////////////////////
//:: Name hx_slp_lovegoodx
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Good Aribeth is Sleeping Man's love, or
     Aribeth is evil.
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
    if (sLove ==  "Aribeth" || iAlignment == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
