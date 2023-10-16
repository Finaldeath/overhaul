//::///////////////////////////////////////////////
//:: Sacrophagus disturb event
//:: q2_sacro_dis
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Create a spirit to attack the player and a minor evil hit.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////


void main()
{
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
        object oSpawn = GetNearestObjectByTag("Q2_MONSTER_SPAWN");
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
        DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oSpawn)));
        object oSpirit = CreateObject(OBJECT_TYPE_CREATURE, "allip001", GetLocation(oSpawn));
        DelayCommand(0.3, AssignCommand(oSpirit, ActionAttack(GetLastDisturbed())));
        if(GetAlignmentGoodEvil(GetLastUsedBy()) != ALIGNMENT_EVIL)
        {
            FloatingTextStrRefOnCreature(40408, GetLastUsedBy());
            AdjustAlignment(GetLastUsedBy(), ALIGNMENT_EVIL, 1);
        }
    }
}
