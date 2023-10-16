//::///////////////////////////////////////////////
//:: User Defined
//:: m2q3HellDoor_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The door opens when the chest is opened.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 7, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 300:
            ActionOpenDoor(OBJECT_SELF);
        break;
    }
}
