//::///////////////////////////////////////////////
//:: Name act_q2evilpath_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Freeze the PC during this conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct 2/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    effect eEffect = EffectCutsceneImmobilize();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oPC);
}
