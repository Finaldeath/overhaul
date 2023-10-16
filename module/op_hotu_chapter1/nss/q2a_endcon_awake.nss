//::///////////////////////////////////////////////
//:: Name q2a_endcon_awake
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At the end of the prologue conversation, the
    Assassin will be created and attempt to
    start conversation with the PC

    UPDATE 08/11/03 - Assassin is now a thief who will
    steal the PCs equipment (chest)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 7/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    SetLocalInt(GetModule(), "INIT_IMMOBILIZE_REMOVED", 1);
    //Remove immobabize effect from PC
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectCreator(eEffect) == oArea)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }

    //Thief will teleport the PCs chest away
    object oThief = GetObjectByTag("q2adrowassassin");
    AssignCommand(oThief, ClearAllActions());
    object oContainer = GetObjectByTag("q2a_pc_equip");
    AssignCommand(oThief, ActionCastFakeSpellAtObject(SPELL_GRENADE_ACID, oContainer));


    DelayCommand(1.0, ChangeToStandardFaction(oThief, STANDARD_FACTION_HOSTILE));
    effect eVfx1 = EffectVisualEffect(VFX_DUR_PIXIEDUST);
    effect eVfx2 = EffectVisualEffect(VFX_IMP_HEALING_M);

    effect eLink = EffectLinkEffects(eVfx1, eVfx2);
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oContainer));
    DelayCommand(2.5, AssignCommand(oThief, SpeakStringByStrRef(85673)));
    DelayCommand(3.0, AssignCommand(oThief, DetermineCombatRound()));
    DestroyObject(oContainer, 3.0);
}
