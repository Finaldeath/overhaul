//::///////////////////////////////////////////////
//:: Destroy spider sacs
//:: q2_sacs_dest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When player destroys the main spider sacs, the other 2 non-usable ones also explode.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////


#include "q2_inc_plot"

void main()
{
    object oPC = GetLastKiller();
    if(!GetIsPC(oPC))
        oPC = GetLastHostileActor();
    if(!GetIsPC(oPC))
        oPC = GetFirstPC();
    object oSacs1 = GetNearestObjectByTag("Q2_SPIDER_SACS1");
    object oSacs2 = GetNearestObjectByTag("Q2_SPIDER_SACS2");

    effect eDam = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oSacs1);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oSacs2);

    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYQ2_SPIDERS") == 0)
    {
        SetPlot("Q2_SPIDERS", 80, oPC);
    }
    else
    {
        SetPlot("Q2_SPIDERS", 90, oPC);
    }
}
