//::///////////////////////////////////////////////
//:: Name q1b_spl_szaren
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On attacked - Szaren will teleport away..
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Mar 3/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetLastSpellCaster();
    if(GetLastSpellHarmful())
    {
        if (GetLocalInt(OBJECT_SELF, "nAttackedOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nAttackedOnce", 1);
            SpeakStringByStrRef(40362);
            //Szaren casts a fake spell
            ActionCastFakeSpellAtObject(SPELL_POLYMORPH_SELF, OBJECT_SELF);
            //Teleportation Locations
            location lSelf = GetLocation(OBJECT_SELF);
            vector vSelf = GetPosition(OBJECT_SELF);
            vSelf = Vector(vSelf.x, vSelf.y, vSelf.z + 1.00);
            location lSelf1 = Location(GetArea(OBJECT_SELF), vSelf, 0.0);

            //Apply Teleportation effects
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_G), lSelf));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_G), lSelf1));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SOUND_BURST), lSelf));

            //Destroy Szaren
            DestroyObject(OBJECT_SELF, 3.0);
            AddJournalQuestEntry("q1bthay", 60, oPC);
            RewardXP("xplow",25,oPC);
        }
    }
}
