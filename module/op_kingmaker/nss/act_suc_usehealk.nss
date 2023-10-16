//::///////////////////////////////////////////////
//:: act_suc_usehealk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC uses a healing kit
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oSuc = GetObjectByTag("q3_dying");
    object oKit1 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT001");//+1
    object oKit2 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT004");//+10
    object oKit3 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT002");//+3
    object oKit4 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT003");//+6
    if(GetIsObjectValid(oKit1))
    {
        DestroyObject(oKit1);
    }
    else if(GetIsObjectValid(oKit3))
    {
        DestroyObject(oKit3);
    }
    else if(GetIsObjectValid(oKit4))
    {
        DestroyObject(oKit4);
    }
    else if(GetIsObjectValid(oKit2))
    {
        DestroyObject(oKit2);
    }
    effect eVis = EffectVisualEffect(VFX_IMP_HEALING_S);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eVis,oSuc);
}
