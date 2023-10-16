//::///////////////////////////////////////////////
//:: Default User Defined Event
//:: FileName: q2bs_ud_vampfairy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void RaiseSkelBomb();

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel() == AI_LEVEL_VERY_LOW)
            return;
        if (GetLocalInt(OBJECT_SELF, "nUnderAttack") == 0)
            return;

        //PC in room - so every heartbeat raise to skeleton bombs to
        //launch at the PC..
        object oSpellTarget = GetWaypointByTag("wp_q2bs_ritual");
        ActionCastFakeSpellAtObject(SPELL_POWER_WORD_STUN, oSpellTarget);
        DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), GetLocation(oSpellTarget)));

        //object oSpawnTarget1 = GetWaypointByTag("wp_q2bs_ritual_spawn1");
        //object oSpawnTarget2 = GetWaypointByTag("wp_q2bs_ritual_spawn2");

        //Stuff to do once...
        if (GetLocalInt(OBJECT_SELF, "nSwirlApplied") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nSwirlApplied", 1);
            effect eSwirl = EffectVisualEffect(134);
            //effect eShield = EffectDamageShield(
            DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSwirl, GetLocation(oSpellTarget), 30.0));
            //DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY
            DelayCommand(33.0, SetLocalInt(OBJECT_SELF, "nSwirlApplied", 0));
        }
        DelayCommand(3.0, RaiseSkelBomb());

    }
    else if(nUser == 1007) // DEATH
    {
        SetLocalInt(GetModule(), "X2_Q2BBombmakerDead", 1);
    }


}
void RaiseSkelBomb()
{

    object oBones = GetNearestObjectByTag("q2bs_ritualbones");
    if (oBones != OBJECT_INVALID)
    {
        //Maximum 7 skeleton bombers in existance at once..
        if (GetLocalInt(GetModule(), "X2_Q2BBombers") < 8)
        {
            string szSkelly = "x2_q2_skelbomb";

            effect eVfx1 = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
            effect eVfx2 = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            effect eLink = EffectLinkEffects(eVfx1, eVfx2);
            //transformation VFX
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, GetLocation(oBones));

            object oSkelly = CreateObject(OBJECT_TYPE_CREATURE, szSkelly, GetLocation(oBones));
            DestroyObject(oBones);
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            AssignCommand(oSkelly, DetermineCombatRound(oPC));
        }
    }
}
