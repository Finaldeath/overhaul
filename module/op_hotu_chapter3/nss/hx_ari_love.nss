//::///////////////////////////////////////////////
//:: Name hx_ari_love
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth's Love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sRomance = GetLocalString(GetModule(), "sKnower_SleepingMansLove");

    if(sRomance == "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}
