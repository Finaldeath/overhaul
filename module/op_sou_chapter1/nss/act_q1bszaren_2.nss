//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give 100gp to the PC and full xp
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 25, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_SzarenXPRewarded") != 1)
    {
        SetLocalInt(oPC, "X1_SzarenXPRewarded", 1);
        GiveGoldToCreature(GetPCSpeaker(), 100);

        RewardXP("xplow",100,GetPCSpeaker());
    }
    SetLocalInt(GetModule(),"X1_SZARENDONE",10);

        //Setup the Thaymart store..

    ExecuteScript("q1thaymart", oPC);

    //Szaren casts a fake spell
    ActionCastFakeSpellAtObject(SPELL_POLYMORPH_SELF, OBJECT_SELF);
    SetCommandable(FALSE);
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
}
