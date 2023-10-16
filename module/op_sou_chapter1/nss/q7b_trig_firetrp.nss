//::///////////////////////////////////////////////
//:: Name q7b_trig_firetrp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Head rising out of the water and spitting fire trap.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 17/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "nw_i0_generic"

void CreateFireHead(location lLocation);
void SetOffTrap(location lLocation);

void main()
{
    object oPC = GetEnteringObject();
    object oArea = GetArea(OBJECT_SELF);

    if (GetIsPlayerCharacter(oPC) == TRUE  && GetLocalInt(oArea, "nTrapTriggered") != 1)
    {
        SetLocalInt(oArea, "nTrapTriggered", 1);
        //Play Trap triggered sound
        AssignCommand(oPC, PlaySound("as_dr_metlprtop1"));
        effect eEffect = EffectSlow();
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, 30.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC, 30.0);
        //Initial Statue Location
        vector vStatueWP = GetPosition(GetWaypointByTag("wp_firestatue"));
        vector vInitial = Vector(vStatueWP.x, vStatueWP.y, vStatueWP.z - 2.0);
        location lInitial = Location(oArea, vInitial, 100.0);
        //rising head locations
        vector vHead1 = Vector(vStatueWP.x, vStatueWP.y, vStatueWP.z - 1.5);
        location lHead1 = Location(oArea, vHead1, 100.0);

        vector vHead2 = Vector(vStatueWP.x, vStatueWP.y, vStatueWP.z - 1.0);
        location lHead2 = Location(oArea, vHead2, 100.0);

        vector vHead3 = Vector(vStatueWP.x, vStatueWP.y, vStatueWP.z - 0.5);
        location lHead3 = Location(oArea, vHead3, 100.0);

        vector vHead4 = Vector(vStatueWP.x, vStatueWP.y, vStatueWP.z - 0.0);
        location lHead4 = Location(oArea, vHead4, 100.0);

        vector vHead5 = Vector(vStatueWP.x, vStatueWP.y, vStatueWP.z + 0.5);
        location lHead5 = Location(oArea, vHead5, 100.0);

        CreateFireHead(lInitial);
        object oSound = GetObjectByTag("snd_q7b_firetrap");
        SoundObjectPlay(oSound);
        DelayCommand(0.5, CreateFireHead(lHead1));
        DelayCommand(1.0, CreateFireHead(lHead2));
        DelayCommand(1.5, CreateFireHead(lHead3));
        DelayCommand(2.0, CreateFireHead(lHead4));
        DelayCommand(2.5, SetOffTrap(lHead5));
        DelayCommand(2.5, SoundObjectStop(oSound));
    }
}
void CreateFireHead(location lLocation)
{
    object oHead = CreateObject(OBJECT_TYPE_PLACEABLE, "q7b_firetraphead", lLocation);
    DestroyObject(oHead, 1.5);

}

void SetOffTrap(location lLocation)
{
    object oArea = GetArea(OBJECT_SELF);
    object oHead = CreateObject(OBJECT_TYPE_PLACEABLE, "q7b_firetraphead", lLocation);
    vector vTargetWP = GetPosition(GetWaypointByTag("wp_firetarget"));
    vector vTarget = Vector(vTargetWP.x, vTargetWP.y, vTargetWP.z + 2.0);
    location lTarget = Location(oArea, vTarget, 100.0);
    AssignCommand(oHead, ActionCastFakeSpellAtLocation(SPELL_FIREBALL, lTarget));
    //DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), lTarget));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_FOGFIRE), lTarget, 30.0));
    //Create some bandits
    location lBandit1 = GetLocation(GetWaypointByTag("wp_q7b_bandittrap_1"));
    location lBandit2 = GetLocation(GetWaypointByTag("wp_q7b_bandittrap_2"));
    object oBandit1 = CreateObject(OBJECT_TYPE_CREATURE, "nw_bandit002", lBandit1);
    object oBandit2 = CreateObject(OBJECT_TYPE_CREATURE, "nw_bandit002", lBandit2);
    AssignCommand(oBandit1, DetermineCombatRound());
    AssignCommand(oBandit2, DetermineCombatRound());

    object oLady1 = GetObjectByTag("q7bhooker1");
    object oLady2 = GetObjectByTag("q7bhooker2");
    AssignCommand(oLady1, ActionEquipMostDamagingMelee());
    AssignCommand(oLady2, ActionEquipMostDamagingMelee());
    AssignCommand(oLady1, DetermineCombatRound());
    AssignCommand(oLady2, DetermineCombatRound());
}
