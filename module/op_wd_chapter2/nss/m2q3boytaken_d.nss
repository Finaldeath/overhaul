//::///////////////////////////////////////////////
//:: User Defined
//:: m2q3BoyTaken_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The boy starts the ambient encounter.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oMom = GetObjectByTag("M2Q03CMARY");

    switch (nEvent)
    {
        case 300:
            if (GetIsObjectValid(oMom))
            {
                CreateObject(OBJECT_TYPE_CREATURE,"M2Q03CSHADCREAT",GetLocation(GetWaypointByTag("WP_M2Q3SHADSPAWN")));
                DelayCommand(2.0,ActionStartConversation(oMom));
            }
        break;
    }
}
