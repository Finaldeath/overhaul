//::///////////////////////////////////////////////
//:: bk_fall_in_hole
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player falls into a sinkhole.
    This moves them to the sinkhole area.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "bk_c2_include"
void TryToJump(object oPC, effect eHide)
{
    // * only show jump animation when area if okay?
    // * still delay it a bit.
    object oArea = GetArea(oPC);
    if (GetIsObjectValid(oArea) == TRUE)
    {           effect eAppear = EffectAppear(1);
        DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, eAppear, oPC));
        DelayCommand(0.6, RemoveEffect(oPC, eHide)); // * remove cutscene invis
        return;
    }
    else
    {
        DelayCommand(0.5, TryToJump(oPC, eHide));
    }
}
void main()
{

    // * transport player and all party members
    // * this script used for both the lower and the upper door
    string sDest = "bk_fall_loc";
    object oClicker = GetEnteringObject();
    if (GetIsPC(oClicker) == FALSE)
    {
        return;
    }
    location lLoc = GetLocation(GetObjectByTag(sDest));
    FadeToBlack(oClicker, FADE_SPEED_FAST);
    FloatingTextStrRefOnCreature(84572, oClicker);
    AssignCommand(oClicker, DelayCommand(1.0, JumpToLocation(lLoc)));
    DelayCommand(1.5, JumpAssociates(oClicker, lLoc, FALSE, TRUE));

    effect eHide = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHide, oClicker);
    DelayCommand(1.0, FadeFromBlack(oClicker, FADE_SPEED_FAST));

    DelayCommand(3.0, TryToJump(oClicker, eHide));

}
