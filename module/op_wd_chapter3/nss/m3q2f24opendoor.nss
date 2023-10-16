//::///////////////////////////////////////////////
//:: M3Q2F24OPENDOOR.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The door opens, unlocking itself.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
//    object oDoor = GetNearestObjectByTag("M3Q2F24MAGICDOOR");
    object oDoor1 = GetObjectByTag("M3Q2F24MAGICDOOR");
//    object oDoor2 = GetObjectByTag("M3Q2G24MAGICDOOR");

    if(GetTag(OBJECT_SELF)=="M3Q2G24MAGICDOOR")
    {
        SetLocked(OBJECT_SELF, FALSE);
        ActionOpenDoor(OBJECT_SELF);
        // * this means conversation will never happen again
        // * with the door
        SetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING",-1);

        SetLocked(oDoor1, FALSE);
        AssignCommand(oDoor1,ActionOpenDoor(oDoor1));
        // * this means conversation will never happen again
        // * with the door
        SetLocalInt(GetArea(oDoor1),"M3Q2FLOCKSREMAINING",-1);
    }
    else
    {
        SetLocked(OBJECT_SELF, FALSE);
        ActionOpenDoor(OBJECT_SELF);
        // * this means conversation will never happen again
        // * with the door
        SetLocalInt(GetArea(OBJECT_SELF),"M3Q2FLOCKSREMAINING",-1);
    }
}
