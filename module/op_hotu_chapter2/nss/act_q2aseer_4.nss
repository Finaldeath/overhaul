//::///////////////////////////////////////////////
//:: Name act_q2aseer_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Launch the prelude to Wave 4 cutscene
    The Beholder and Mindflayer attacks
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 12/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"

void main()
{
    SetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave3Over",2);
    object oPC = GetPCSpeaker();
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
    SetLocalInt(OBJECT_SELF, "Q2B_CASTING", 1);
    //if the beholders are still in - do their cutscene first
    if (GetGlobalInt("x2_plot_beholders_out") == 0)
        ExecuteScript("cutscene107", oPC);
    //else just do the Mindflayers cutscene
    else
        ExecuteScript("cutscene106", oPC);

}
