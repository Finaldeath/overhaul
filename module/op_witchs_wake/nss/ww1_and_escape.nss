//::///////////////////////////////////////////////
//:: Witchwork 1: Ratling Androiin (Escape Area)
//:: WW1_And_Escape.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the Ratling to move to the designated
     doorway and destroy itself.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObjectByTag("???");

    ActionForceMoveToObject(oDoor, FALSE, 1.0, 10.0);
    DestroyObject(OBJECT_SELF, 10.0);
}
