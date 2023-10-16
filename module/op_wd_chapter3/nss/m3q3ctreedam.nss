//::///////////////////////////////////////////////
//:: M3Q3CTreeDam.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Anytime a tree is damaged, the nymphs go hostile
   to the damager.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   January 2002
//:://////////////////////////////////////////////


void main()
{
  object oDryadFaction = GetObjectByTag("M3Q3CSnowDryad");
        AdjustReputation(GetPCSpeaker(), oDryadFaction, -100);
        SetIsTemporaryEnemy(GetPCSpeaker(), oDryadFaction);
}
