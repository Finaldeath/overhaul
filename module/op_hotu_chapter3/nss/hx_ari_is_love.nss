//::///////////////////////////////////////////////
//:: Name hx_ari_is_love
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth is PC's True Love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sRomance = GetLocalString(GetModule(), "sKnower_PlayersLove");

    if(sRomance == "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}
