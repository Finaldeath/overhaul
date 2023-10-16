// Golem controlling amulet: summon/unsummon golem
// NOTE: this script is exectuted when creating the golem for the first time.
// The amulet would teleport the golem near the player and would create the golem
// if he is not yet in the party (for chapter 3)

#include "x0_i0_henchman"

void main()
{
    object oPC = GetItemActivator();
    if(oPC == OBJECT_INVALID)
        oPC = OBJECT_SELF;
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    object oGolem = GetObjectByTag("q4_guardian");
    if(oGolem != OBJECT_INVALID && GetMaster(oGolem) == OBJECT_INVALID)
    // golem exists but has no master (might happen before final cutscenes in
    // chapter 2 or any other place that removes henchmen).
    // -> would jump the golem and re-add to party
    {
        AssignCommand(oGolem, ClearAllActions());
        AssignCommand(oGolem, JumpToObject(oPC));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oGolem));
        DelayCommand(2.0, AddHenchman(oPC, oGolem));
        DelayCommand(3.0, SetIsFollower(oGolem, TRUE));
    }

    else if(oGolem == OBJECT_INVALID)
    // golem does not exist at all.
    // should be the first time used at chapter 3 and first time in chapter 2.
    // NOTE: if the golem died it would not be possible to summon it again since the amulet
    // would be destroyed.
    {
        object oGolem = CreateObject(OBJECT_TYPE_CREATURE, "q4_guardian", GetLocation(oPC));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oGolem));
        AddHenchman(oPC, oGolem);
        SetIsFollower(oGolem, TRUE);
    }
    else if(oGolem != OBJECT_INVALID && GetMaster(oGolem) == oPC)
    // golem is in the party, so he would just be teleported near the pc
    {
        AssignCommand(oGolem, ClearAllActions());
        AssignCommand(oGolem, JumpToObject(oPC));
        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oGolem));
    }




}
