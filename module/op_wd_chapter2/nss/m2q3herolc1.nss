//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3HeroLC1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set the hero quest local to 1, ending the quest.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void main()
{
    object oSarcophagus = GetObjectByTag("M2Q3MEAGELSARC");

    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q3HEROQUEST",1);
    AssignCommand(oSarcophagus,ActionUnlockObject(oSarcophagus));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUNBEAM),GetLocation(OBJECT_SELF));
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_MaegalSpawn",0);
    DestroyObject(OBJECT_SELF);
}
