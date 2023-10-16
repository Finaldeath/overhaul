//::///////////////////////////////////////////////
//:: Catching the Wise Wind (Action - Replace)
//:: A_Catching_Replc.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Replace the Empty Tome with The Catching of
     the Wise Wind.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    //Replace the Empty Tome
    location lLoc = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_PLACEABLE, "CatchingTheWind", lLoc);
    DestroyObject(OBJECT_SELF, 0.1);
}
