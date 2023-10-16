//::///////////////////////////////////////////////
//:: NW_C2_GARGOYLE.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   on gargoyle's heartbeat, if no PC nearby then become a statue
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 17, 2001
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if ((GetIsObjectValid(oPC) != TRUE) || (GetIsDead(oPC) == TRUE) || GetDistanceToObject(oPC) >= 10.0)
    {

        CreateObject(OBJECT_TYPE_PLACEABLE, "M2Q3PWANEVGAR", GetLocation(OBJECT_SELF));
        DestroyObject(OBJECT_SELF, 0.5);
    }
}
