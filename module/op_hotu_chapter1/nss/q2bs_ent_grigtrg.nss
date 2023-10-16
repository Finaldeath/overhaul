//::///////////////////////////////////////////////
//:: Name q2bs_ent_grigtrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Enter - the 3 grigs will rush to their separate
    coffins and raise some zombies before fighting the PCs
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 18/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void CreateProtector(object oSpawnPoint, object oTarget, object oCreator, object oCoffin);
void GrigSpeak(object oGrig);

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        object oGrig1 = GetObjectByTag("q2bs_evilgrig1");
        object oGrig2 = GetObjectByTag("q2bs_evilgrig2");
        object oGrig3 = GetObjectByTag("q2bs_evilgrig3");

        object oSpawnTarget1 = GetWaypointByTag("wp_q2bs_zomcoffin_1");
        object oSpawnTarget2 = GetWaypointByTag("wp_q2bs_zomcoffin_2");
        object oSpawnTarget3 = GetWaypointByTag("wp_q2bs_zomcoffin_3");

        object oCoffin1 = GetObjectByTag("q2bs_zomcoffin_1");
        object oCoffin2 = GetObjectByTag("q2bs_zomcoffin_2");
        object oCoffin3 = GetObjectByTag("q2bs_zomcoffin_3");

        //Grig will shout out a warning
        AssignCommand(oGrig1, ClearAllActions());
        AssignCommand(oGrig2, ClearAllActions());
        AssignCommand(oGrig3, ClearAllActions());

        GrigSpeak(oGrig1);
        //Move to their assign coffins
        DelayCommand(1.0, AssignCommand(oGrig1, ActionMoveToObject(oCoffin1, TRUE)));
        DelayCommand(1.0, AssignCommand(oGrig2, ActionMoveToObject(oCoffin2, TRUE)));
        DelayCommand(1.0, AssignCommand(oGrig3, ActionMoveToObject(oCoffin3, TRUE)));
        //raise the protectors
        DelayCommand(5.0, AssignCommand(oGrig1, ActionCastFakeSpellAtObject(SPELL_ANIMATE_DEAD, oCoffin1)));
        DelayCommand(5.0, AssignCommand(oGrig2, ActionCastFakeSpellAtObject(SPELL_ANIMATE_DEAD, oCoffin2)));
        DelayCommand(5.0, AssignCommand(oGrig3, ActionCastFakeSpellAtObject(SPELL_ANIMATE_DEAD, oCoffin3)));

        DelayCommand(7.0, CreateProtector(oSpawnTarget1, oPC, oGrig1, oCoffin1));
        DelayCommand(7.0, CreateProtector(oSpawnTarget2, oPC, oGrig2, oCoffin2));
        DelayCommand(7.0, CreateProtector(oSpawnTarget3, oPC, oGrig3, oCoffin3));

        DelayCommand(9.0, AssignCommand(oGrig1, DetermineCombatRound(oPC)));
        DelayCommand(9.0, AssignCommand(oGrig2, DetermineCombatRound(oPC)));
        DelayCommand(9.0, AssignCommand(oGrig3, DetermineCombatRound(oPC)));
    }
}

//Don't spawn in a zombie if the grig trying to raise it is dead..
void CreateProtector(object oSpawnPoint, object oTarget, object oCreator, object oCoffin)
{
    if (GetIsObjectValid(oCreator) == FALSE)
        return;

    if (GetIsDead(oCreator) == TRUE)
        return;

    location lSpawn = GetLocation(oSpawnPoint);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), lSpawn);
    object oZombie = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2bs_zomlord", lSpawn);
    AssignCommand(oZombie, DetermineCombatRound(oTarget));

    SetLocalInt(oCoffin, "nZombieCreated", 1);
}

//Try not to let dead grigs speak
void GrigSpeak(object oGrig)
{
    if (GetIsObjectValid(oGrig) == FALSE)
        return;

    if (GetIsDead(oGrig) == TRUE)
        return;

    AssignCommand(oGrig, SpeakStringByStrRef(84075, TALKVOLUME_SHOUT));

}
