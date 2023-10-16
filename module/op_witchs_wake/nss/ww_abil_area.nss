//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Area User-Defined Template
//:: WW_Abil_Area.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A template script for the handling of any
     alarm behavior within the Witchwork
     Conversation System.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2002
//:://////////////////////////////////////////////

void main()
{
    int iUDEventNum = GetUserDefinedEventNumber();

    switch (iUDEventNum)
    {
        //If an Alarm is raised via the Witchwork Conversation System
        case 1701:
        {
            object oObject = GetFirstObjectInArea(OBJECT_SELF);
            string sAreaTag = GetTag(OBJECT_SELF);

            //Send an alarm message to every PC in the area.
            while (oObject != OBJECT_INVALID)
            {
                if (GetIsPC(oObject) == TRUE)
                {
                    SendMessageToPC(oObject, "An alarm has sounded.");
                }

                oObject = GetNextObjectInArea(OBJECT_SELF);
            }

            //Send a more detailed message to all DMs.
            SendMessageToAllDMs("An alarm has sounded in "+sAreaTag+".");

            //////////////////////////////////////////
            //Add custom behavior here.
            //////////////////////////////////////////
        }
        break;
    }
}
