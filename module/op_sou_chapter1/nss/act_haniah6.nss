//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets Haniah as slightly happier with the PC, sets
     Piper plot over, and gives 60 gold and 100% xp
     as reward.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetPCSpeaker(),"HANIAHLOVE",GetLocalInt(GetPCSpeaker(),"HANIAHLOVE")+10);
    SetLocalInt(GetPCSpeaker(),"X1_PIPERQUEST",99);
    GiveGoldToCreature(GetPCSpeaker(),60);
    RewardXP("xplow",100,GetPCSpeaker());
    int nAlign = GetAlignmentLawChaos(GetPCSpeaker());
    if (nAlign == ALIGNMENT_CHAOTIC)
    {
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_LAWFUL, 3);
    }
}
