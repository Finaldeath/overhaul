//::///////////////////////////////////////////////
//:: Scrivener, New Nav Point (Action Script)
//:: H2a_Scrv_NavNew.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Marks current Nav Point as successful and
     assigns a new one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    //Get the current Nav Point and save it out as successful.
    string sNavPoint = GetLocalString(OBJECT_SELF, "sNavPoint");
    SetLocalString(OBJECT_SELF, "sPreviousNavPoint", sNavPoint);

    //Assign a new Nav Point based on what the current one is.
    if (sNavPoint == "Treason")
    {
        SetLocalString(OBJECT_SELF, "sNavPoint", "Dimension");
    }
    else if (sNavPoint == "Dimension")
    {
        SetLocalString(OBJECT_SELF, "sNavPoint", "Infinity");
    }

    //If it's not the first or second Nav Point, there are no new ones to
    //assign. Just clear out the existing one.
    else
    {
        SetLocalString(OBJECT_SELF, "sNavPoint", "COMPLETE");
    }
}
