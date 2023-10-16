//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3TakeBoy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The shadowy creature takes the boy away.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    object oShadow = GetNearestObjectByTag("M2Q03CSHADCREAT");

    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken",20);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY),oShadow,1.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY),OBJECT_SELF,1.0);
    DestroyObject(oShadow,1.0);
    DestroyObject(OBJECT_SELF,1.0);
    SetCommandable(FALSE);
}
