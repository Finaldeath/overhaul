//::///////////////////////////////////////////////
//:: Name hx_cata_start_f
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set the catapult's initial facing.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 2, 2003
//:://////////////////////////////////////////////

void main()
{
    int iStart = GetLocalInt(OBJECT_SELF, "HX_FINAL_PUZZLE_STARTED");

    if(iStart != 1)
    {
        object oWP = GetObjectByTag("hx_catapult_facing_07");

        SetLocalInt(OBJECT_SELF, "HX_FINAL_PUZZLE_STARTED", 1);
        SetLocalObject(OBJECT_SELF, "HX_FINAL_FACING", oWP);
    }
}
