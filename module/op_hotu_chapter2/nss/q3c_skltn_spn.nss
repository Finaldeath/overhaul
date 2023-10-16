//::///////////////////////////////////////////////
//:: NW_O2_SKELETON.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Spawns a skeleton warrior when gets an outside event
*/
//:://////////////////////////////////////////////
//:: Created By:   Yaron
//:: Created On:   28/1/2003
//:://////////////////////////////////////////////
void ActionCreate(string sCreature, location lLoc)
{
    object oSkeleton = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    DelayCommand(0.3, AssignCommand(oSkeleton, ActionAttack(oPC)));
}
void main()
{
   int nEvent = GetUserDefinedEventNumber();
   if(nEvent == 101) // bring'm in!
   {
        effect eMind = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
        string sCreature = "skeletonwarrior";
        location lLoc = GetLocation(OBJECT_SELF);
        DelayCommand(0.3, ActionCreate(sCreature, lLoc));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMind, GetLocation(OBJECT_SELF));
        SetPlotFlag(OBJECT_SELF, FALSE);
        DestroyObject(OBJECT_SELF, 0.5);
    }
}
