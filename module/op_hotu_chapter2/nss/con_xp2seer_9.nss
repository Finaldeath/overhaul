//::///////////////////////////////////////////////
//:: Name con_xp2seer_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is the Seer's speech before the
    PC heads off to the siege
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 29/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_StartSeerSiegeSpeech") == 1)
        return TRUE;
    return FALSE;
}
