//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic on enter script for areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 28, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void StartCutscene(object oPC, int iCut);

void main()
{
    object oPC = GetEnteringObject();
    object oRelic = GetItemPossessedBy(oPC, "x2_p_reaper");

    //Strip the Relic of the Reaper
    if (GetIsPC(oPC) && GetIsObjectValid(oRelic))
    {
        DestroyObject(oRelic);
    }


    if(GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nDoOnce") == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", TRUE);
        ExecuteScript("x2_c3_start", OBJECT_SELF);
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
