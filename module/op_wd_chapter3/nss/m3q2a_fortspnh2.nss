//::///////////////////////////////////////////////
//:: M3Q2A_FORTSPNH.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Infinite respawn -- always keeps around 5
   guards in the area.

   CONDITIONS:
   - only spawns if Subchief is still alive & Trigger
     has been crossed
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////


#include "M3PLOTINCLUDE"

void main()
{
    // * if Subchief has been killed then stop spawning
    // * creatures and destroy self to preserve AI
    if (GetIsObjectValid(GetObjectByTag("M3Q2A14ARNESS")) == FALSE)
    {
        DestroyObject(OBJECT_SELF);

    }

    // * if trigger has not been crossed yet then don't start the war
    if (GetLocalInt(GetObjectByTag("M3Q2StartTheWar"),"NW_L_DOONCE") != 1)
    {
     return;
    }
    if (CountFactionMembers(OBJECT_SELF) <3)
    {
       // SpeakString("More");
        CreateObject(OBJECT_TYPE_CREATURE,"M3Q1HOSTILEELK9",GetLocation(OBJECT_SELF));
    }
}
