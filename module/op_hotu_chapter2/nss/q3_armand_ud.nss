//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "x2c2_inc_plot"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
        effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
        Reward_2daXP(GetFirstPC(), 20);
        int i = 1;
        object oElemental = GetNearestObjectByTag("q3b_fire_elemental", OBJECT_SELF, i);
        effect eUnsummon = EffectVisualEffect(VFX_IMP_UNSUMMON);
        while(oElemental != OBJECT_INVALID)
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(oElemental));
            DestroyObject(oElemental);
            i++;
            oElemental = GetNearestObjectByTag("q3b_fire_elemental", OBJECT_SELF, i);
        }
        SetLocalInt(GetModule(), "bArmandKilled", 1); // used in chapter 3
        SetPlot("q3_dracolich", 50);
    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 101) // buff
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_BUFF_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_BUFF_ONCE", 1);

        object oDoor = GetNearestObjectByTag("q3b_armanddoor");
        SetFacingPoint(GetPosition(oDoor));
        //ActionCastSpellAtObject(SPELL_HASTE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_PREMONITION, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_ELEMENTAL_SHIELD, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_GREATER_SPELL_MANTLE, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_ENERGY_BUFFER, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_FOXS_CUNNING, OBJECT_SELF);
       //ActionCastSpellAtObject(SPELL_HASTE, OBJECT_SELF);

    }

}


