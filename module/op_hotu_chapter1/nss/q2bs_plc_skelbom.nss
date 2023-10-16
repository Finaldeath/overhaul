//::///////////////////////////////////////////////
//:: q2bs_plc_skelbom.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Turns the placeable into a skeleton
   if a player comes near enough.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   January 17, 2002
//:://////////////////////////////////////////////
void ActionCreate(string sCreature, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc);
}
void main()
{
   object oCreature = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
   if (GetIsObjectValid(oCreature) == TRUE && GetDistanceToObject(oCreature) < 10.0)
   {
        //Maximum 7 skeleton bombers in existance at once..
        if (GetLocalInt(GetModule(), "X2_Q2BBombers") < 8)
        {
            effect eMind = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            string sCreature = "x2_q2_skelbomb";
            location lLoc = GetLocation(OBJECT_SELF);
            DelayCommand(0.3, ActionCreate(sCreature, lLoc));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eMind, GetLocation(OBJECT_SELF));
            SetPlotFlag(OBJECT_SELF, FALSE);
            DestroyObject(OBJECT_SELF, 0.5);
        }
   }
}
