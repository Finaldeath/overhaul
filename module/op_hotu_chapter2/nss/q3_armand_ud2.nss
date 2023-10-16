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
#include "nw_i0_generic"

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
        //DestroyObject(OBJECT_SELF, 0.3);
        int nCoffin = GetLocalInt(OBJECT_SELF, "COFFIN");
        if(GetTag(OBJECT_SELF) == "q3_CultElderMonk")
            nCoffin = 9;

        if(nCoffin > 0)
        {
            object oCoffin = GetObjectByTag("q3c_coffin" + IntToString(nCoffin));
            SignalEvent(oCoffin, EventUserDefined(101));
            SetLocalLocation(GetArea(OBJECT_SELF), "GAS_LOC", GetLocation(OBJECT_SELF));
            SetLocalLocation(GetArea(OBJECT_SELF), "GAS_TARGET", GetLocation(oCoffin));
            SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102)); // create a gaseous form
        }

    }
    else if(nUser == 1008) // DISTURBED
    {

    }
    else if(nUser == 101) // attack player before dracolich lair
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ATTACK_BEFORE_LAIR_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ATTACK_BEFORE_LAIR_ONCE", 1);


        ActionCastSpellAtObject(SPELL_PREMONITION, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENERGY_BUFFER, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_FOXS_CUNNING, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_HASTE, OBJECT_SELF, METAMAGIC_EXTEND, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);

        ActionCastSpellAtObject(SPELL_MESTILS_ACID_SHEATH, OBJECT_SELF, METAMAGIC_EXTEND);
        ActionCastSpellAtObject(SPELL_GREATER_SPELL_MANTLE, OBJECT_SELF);
        ActionCastSpellAtObject(SPELL_ETHEREAL_VISAGE, OBJECT_SELF);


        ActionDoCommand(DetermineCombatRound());
    }


}


