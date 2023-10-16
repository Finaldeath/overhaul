//::///////////////////////////////////////////////
//:: Name q2d_use_formlev
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When this lever is used - the effects surrounding
    the Formian Queen will end and she will be free..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25/03
//:://////////////////////////////////////////////

void RemoveEffectsFromQueen(object oQueen);
void QueenTalkToPC(object oQueen, object oPC);
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nUsedOnce") == 1)
        return;
    //Move the lever
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    //Destroy the VFX
    object oVfx1 = GetObjectByTag("q2d_formvfx_1");
    object oVfx2 = GetObjectByTag("q2d_formvfx_2");
    object oVfx3 = GetObjectByTag("q2d_formvfx_3");
    object oVfx4 = GetObjectByTag("q2d_formvfx_4");

    DestroyObject(oVfx1, 1.0);
    DestroyObject(oVfx2, 1.0);
    DestroyObject(oVfx3, 1.0);
    DestroyObject(oVfx4, 1.0);

    //Have the Queen become hostile to the drow and
    object oQueen = GetObjectByTag("x2_q2_formqueen");
    SetLocalInt(oQueen, "can_talk", TRUE);
    SetCommandable(TRUE, oQueen);
    SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, 0, oQueen);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oQueen);
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oQueen));

    DelayCommand(1.0, RemoveEffectsFromQueen(oQueen));

    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    DelayCommand(2.0, QueenTalkToPC(oQueen, oPC));
}

void RemoveEffectsFromQueen(object oQueen)
{
    effect eEffect = GetFirstEffect(oQueen);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        RemoveEffect(oQueen, eEffect);
        eEffect = GetNextEffect(oQueen);
    }
}

void QueenTalkToPC(object oQueen, object oPC)
{
    if (IsInConversation(oQueen) == FALSE)
        AssignCommand(oQueen, ActionStartConversation(oPC));
}
