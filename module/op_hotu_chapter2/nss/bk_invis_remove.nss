//::///////////////////////////////////////////////
//:: bk_invis_remove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Removes all "darkness" from bridge hide
    node.

    Draws in electrical bridge.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: September 2003
//:://////////////////////////////////////////////

// * creates one blocker at the makeblocker waypoint
void CreateBlocker()
{
    object oWay = GetObjectByTag("makeblocker");
    CreateObject(OBJECT_TYPE_PLACEABLE, "bk_invis_blck", GetLocation(oWay));
    DestroyObject(oWay);
}
void On(int nValue)
{
    // * create the 3 blockers
    if (nValue == 11003)
    {
        CreateBlocker();
        DelayCommand(0.1, CreateBlocker());
        DelayCommand(0.3, CreateBlocker());
    }

    object oArea = GetArea(OBJECT_SELF);
    object oFirst = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oFirst) == TRUE)
    {
        if (GetObjectType(oFirst) == OBJECT_TYPE_PLACEABLE)
        {
            if (GetTag(oFirst) == "bk_invisibles" || GetTag(oFirst) == "bk_invis_blck")
            {
                SignalEvent(oFirst, EventUserDefined(nValue));
            }
        }
        oFirst = GetNextObjectInArea(oArea);
    }
}
void main()
{
//    if (GetLocalInt(OBJECT_SELF, "on") == 0)
//    {
//        On(11002);
//        SetLocalInt(OBJECT_SELF, "on", 1);
        // * draw electrical bridge

//    }
//    else
//    {
        On(11002);
//        SetLocalInt(OBJECT_SELF, "on", 0);
//    }


}
