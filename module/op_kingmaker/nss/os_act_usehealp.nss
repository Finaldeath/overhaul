//::///////////////////////////////////////////////
//:: os_act_usehealp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC uses a healing potion
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oSuc = GetObjectByTag("q3_dying");
    object oPot1 = GetItemPossessedBy(oPC,"NW_IT_MPOTION003");//critical
    object oPot2 = GetItemPossessedBy(oPC,"NW_IT_MPOTION001");//light
    object oPot3 = GetItemPossessedBy(oPC,"NW_IT_MPOTION020");//moderate
    object oPot4 = GetItemPossessedBy(oPC,"NW_IT_MPOTION002");//serious
    object oPot5 = GetItemPossessedBy(oPC,"NW_IT_MPOTION012");//heal
    if(GetIsObjectValid(oPot2))
    {
        DestroyObject(oPot2);
    }
    else if(GetIsObjectValid(oPot3))
    {
        DestroyObject(oPot3);
    }
    else if(GetIsObjectValid(oPot4))
    {
        DestroyObject(oPot4);
    }
    else if(GetIsObjectValid(oPot1))
    {
        DestroyObject(oPot1);
    }
    else if(GetIsObjectValid(oPot5))
    {
        DestroyObject(oPot5);
    }
    effect eVis = EffectVisualEffect(VFX_IMP_HEALING_S);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oSuc);
}
