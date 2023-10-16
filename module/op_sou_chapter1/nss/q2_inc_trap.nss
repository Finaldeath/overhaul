//::///////////////////////////////////////////////
//:: Handler for kobold trap
//:: q2_inc_trap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    either triggers trap or gives a message. Can be activated by either stepping into
    the trigger or using the pressue plate.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On:3/2/2003
//:://////////////////////////////////////////////


void CheckTrap(object oPC)
{
    if(!GetIsPC(oPC))
        return;
    int nEnabled = GetLocalInt(GetArea(OBJECT_SELF), "Q2_KOBOLD_TRAP_TRIGGERED");
    if(nEnabled == 0) // not working
    {
        //AssignCommand(oPC, ClearAllActions());
        FloatingTextStrRefOnCreature(40409, oPC);
    }
    else // working
    {
        int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(GetArea(OBJECT_SELF), "DO_ONCE", 1);
        //object oCaster = GetObjectByTag("Q2_CASTER");
        int n = 1;
        object oWP = GetNearestObjectByTag("Q2_WP_TRAP_SPAWN", oPC, n);

        effect eCloud = EffectAreaOfEffect(AOE_PER_FOGSTINK, "q2_aoe_trap_oe", "q2_aoe_trap_hb", "q2_aoe_trap_hb");
        int nDuration = 20;
        effect eImpact = EffectVisualEffect(259);


        while(n <= 6 && oWP != OBJECT_INVALID)
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetLocation(oWP));
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eCloud, GetLocation(oWP), RoundsToSeconds(nDuration));
            //AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_STINKING_CLOUD, oWP, METAMAGIC_ANY, TRUE));
            n++;
            oWP = GetNearestObjectByTag("Q2_WP_TRAP_SPAWN", oPC, n);
        }

        object oPC = GetFirstPC();
        while(oPC != OBJECT_INVALID)
        {
            GiveXPToCreature(oPC, 100);
            oPC = GetNextPC();
        }
    }
}
