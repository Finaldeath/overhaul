//::///////////////////////////////////////////////
//:: Name: act_q1bszaren_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Szaren teleports away... and creates a store
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 20/03
//:://////////////////////////////////////////////

void main()
{
    //Setup the Thaymart store..
    object oPC = GetPCSpeaker();
    ExecuteScript("q1thaymart", oPC);

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

}
