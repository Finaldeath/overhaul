//::///////////////////////////////////////////////
//:: Tranmitter On Death
//:: 2Q4E_Transmit_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   On the death of the tranmitter destroy the
   appropriate skull pile portal.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 11, 2002
//:://////////////////////////////////////////////

void main()
{
    //Skull piles
    object oPortal1 = GetObjectByTag("2Q4E_BonePortal01");
    object oPortal2 = GetObjectByTag("2Q4E_BonePortal02");

    effect eVis = EffectVisualEffect(VFX_FNF_PWSTUN);
    if(GetTag(OBJECT_SELF) == "2Q4E_BoneTrans01")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPortal1);
        DestroyObject(oPortal1, 1.5);
    }
    else
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPortal2);
        DestroyObject(oPortal2, 1.5);
    }
}
