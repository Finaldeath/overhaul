//::///////////////////////////////////////////////
//:: Chronicles of Abaran Area (OnExit)
//:: Area_Opening_Ex.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Destroy all of the cutscene creatures so they
     can be respawned OnEnter.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 16, 2004
//:://////////////////////////////////////////////
#include "inc_rob"

void main()
{
    DestroyAllNPCsInArea();
}
