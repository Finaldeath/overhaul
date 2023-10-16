//::///////////////////////////////////////////////
//:: Name: q2e_use_throne
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mechanic: There are four thrones that look into a "fighting pit" area.
    Every 30 seconds, an additional random monster spawns into that area…
    but there will never be more than two of these creatures at a single time.
    These random creatures fight each other as well as the creatures spawned in
    by the thrones.
    When someone sits upon a throne, it should cause a visual effect both on
    the throne and in the pit where a creature is spawned in… making it obvious
    that their sitting down is what caused this (display a string over the PC's
    head that says "Part of you feels it has been torn out and used to create the
    creature before you."). Each "throne" can only have one creature spawned in at
    a time.
    When a creature belonging to a throne is killed, its "owner" loses 1000 XP
    regardless of whether or not he is still sitting on the throne (use a magical
    effect and display a string over the PC's head that says "Your creature in the
    ring has died, taking part of your essence with it.").
    When a creature belonging to a throne kills another creature, its "owner"
    gains a benefit… but only if he is still seated on the throne. The benefit
    is 2,000 XP and is accompanied by a magical effect.
    All the creatures that are spawned in, though they might use different models,
    should use the same statistics and have the same hit points.

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 15/03
//:://////////////////////////////////////////////
// * click on me and you shall sit
void main()
{
    //Sit the PC down on the throne
    object oSelf = OBJECT_SELF;
    AssignCommand(GetLastUsedBy(), ActionSit(oSelf));

    //Only one creature per throne can be in existence at any one time.

    if (GetIsObjectValid(GetObjectByTag(GetStringRight(GetTag(oSelf), 1) + "ThroneBeast")) == FALSE)
    {
        //Cause an effect both on the throne and on the spawnpoint in the pit
        object oSpawnPoint = GetObjectByTag("wp_hellspawn_3");
        effect eSpawn = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpawn, GetLocation(oSelf));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSpawn, GetLocation(oSpawnPoint));

        location lTarget = GetLocation(GetWaypointByTag("wp_hellspawn_3"));
        object oNewCreature = CreateObject(OBJECT_TYPE_CREATURE, "q2e_thronecr" + GetStringRight(GetTag(oSelf), 1), lTarget, FALSE, GetStringRight(GetTag(oSelf), 1) + "ThroneBeast");
        SetLocalString(oNewCreature, "szOwner", GetName(GetLastUsedBy()));
    }



}
