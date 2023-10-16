//::///////////////////////////////////////////////
//:: Entered
//:: M2Q5ZamithGoUp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This trigger creates a new Zamithra upstairs
    and destroys the old one.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    if (GetTag(oEntered) == "M2Q1CSHAR")
    {
        ActionOpenDoor(GetObjectByTag("M2Q5N_M2Q5O"));
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q1CSHAR2",GetLocation(GetWaypointByTag("WP_ZAMITH")));
        DestroyObject(oEntered);
    }
}
