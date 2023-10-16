//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Open Store Post-Name (Action Script)
//:: H2a_Gruul_Store3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Opens Gru'ul's store and makes him go away.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Ocotber 7, 2003
//:://////////////////////////////////////////////

void main()
{
    //Open store
    object oPC = GetPCSpeaker();
    object oStore = GetObjectByTag("H2_GruulStore");
    OpenStore(oStore, oPC);

    //Get rid of Gruul
    effect eVFX = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF);
    //DestroyObject(OBJECT_SELF, 0.5);
}

