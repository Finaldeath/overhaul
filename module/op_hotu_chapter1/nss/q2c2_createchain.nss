//::///////////////////////////////////////////////
//:: Name q2c2_createchain
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create the appropriate coloured chain above
    the pedastal that was clicked.  Colour
    stored in module variable szAttachChain.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 6/02
//:://////////////////////////////////////////////


void main()
{
    DestroyObject(GetObjectByTag("q2c2_chain_" + GetLocalString(GetModule(), "szAttachChain")));
    location lTarget = GetLocation(GetWaypointByTag("wp_chain_" + GetLocalString(GetModule(), "szAttachChain")));
    string szChain = "q2c2_chain";

    CreateObject(OBJECT_TYPE_PLACEABLE, szChain, lTarget);


    //Set a local variable so that the pedastal knows that it has been set.
    SetLocalInt(OBJECT_SELF, "nChainOn", 1);
    //Increment the local variable for the count of how many chains have been activated.
    SetLocalInt(GetModule(), "nQ2C2ChainCount", GetLocalInt(GetModule(), "nQ2C2ChainCount") + 1);
    //if all 4 chains are attached - add journal entry and create sparks on well
    if (GetLocalInt(GetModule(), "nQ2C2ChainCount") == 4)
    {
        location lTarget = GetLocation(GetWaypointByTag("wp_lev2_wellsparks"));
        CreateObject(OBJECT_TYPE_PLACEABLE, "q2c_wellsparks", lTarget);

    }
}
