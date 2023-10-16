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

    /*if(GetIsPC(oPC) && GetLocalInt(OBJECT_SELF, "bDoOnce") == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        int x = 0;
        object oHand = GetObjectByTag("hx_sleep_altar", x);

        while(GetIsObjectValid(oHand))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_GREEN), oHand);
            x = x + 1;
            oHand = GetObjectByTag("hx_sleep_altar", x);
        }
    }*/

    if(GetIsPC(oPC))
    {
       object oSleep = GetObjectByTag("H2_SleepingMan");

       BlackScreen(oPC);
       DelayCommand(1.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

        int bAwake = GetLocalInt(oSleep, "bAwake");
        if (bAwake == FALSE)
        {
            effect eSleep = ExtraordinaryEffect(EffectSleep());
            SetPlotFlag(oSleep, FALSE);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oSleep, 7.0);
            SetPlotFlag(oSleep, TRUE);
        }
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}
